class Friendship < ActiveRecord::Base
  #The user who initiated the friendship
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  #The user who is being befriended
  belongs_to :friend, :foreign_key => "friend_id", :class_name => 'User'

  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :user_id, :scope => [:friend_id],
    :message => "You are already friends with this person"

  class << self
    # Finds friendship using user and friend
    def locate(user, friend)
      find_by_user_id_and_friend_id(user, friend).id
    end

    # Return true if the users are (possibly pending) friends
    def exists?(user, friend)
      if find_by_user_id_and_friend_id(user, friend).nil?
        return false
      else
        checking = find_by_user_id_and_friend_id(user, friend).status
        if checking == "rejected"
          return false
        else
          return true
        end
      end
    end

    # Record a pending friend request
    def request(user, friend)
      unless user == friend || Friendship.exists?(user, friend)
        # Transaction used here which ensures all block statements execute or none
        transaction do
          create(:user => user, :friend => friend, :status => 'requested')
          create(:user => friend, :friend => user, :status => 'pending')
        end
      end
    end

    # Accept a friend request
    def accept(user, friend)
      transaction do
        accept_one_side(user, friend)
        accept_one_side(friend, user)
      end
    end

    # Delete a friendship or cancel a pending request
    def breakup(user, friend)
      transaction do
        reject_one_side(user, friend)
        reject_one_side(friend, user)
      end
    end

    private
    # Update the db with one side of an accepted friendship request
    def accept_one_side(user, friend)
      request = find_by_user_id_and_friend_id(user, friend)
      request.status = 'accepted'
      request.save!
    end

    def reject_one_side(user, friend)
      request = find_by_user_id_and_friend_id(user, friend)
      request.status = 'rejected'
      request.save!
    end
  end
end
