require 'spec_helper'

describe Friendship do
  fixtures :users

  before(:each) do
    @user= users(:dan)
    @friend= users(:john)
  end

  it "should allow requesting a friendship" do
    Friendship.request(@user, @friend)
    Friendship.exists?(@user, @friend).should be_true
    assert_status @user, @friend, 'pending'
    assert_status @friend, @user, 'pending'
  end

  it "should accept friendships" do
    Friendship.request(@user, @friend)
    Friendship.accept(@user, @friend)
    Friendship.exists?(@user, @friend).should be_true
    assert_status @user, @friend, 'accepted'
    assert_status @friend, @user, 'accepted'
  end

  it "should break friendships when requested" do
    Friendship.request(@user, @friend)
    Friendship.accept(@user, @friend)
    Friendship.breakup(@user, @friend)
    !Friendship.exists?(@user, @friend).should be_false
    !Friendship.exists?(@friend, @user).should be_false
  end

  private

  # Verify the existence of a friendship with the given status.
  def assert_status(user, friend, status)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    status == friendship.status
  end
end
