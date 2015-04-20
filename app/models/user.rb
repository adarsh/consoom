class User < ActiveRecord::Base
  # Includes for adding in Gravatars
  include Gravtastic
  # is_gravtastic
  gravtastic :secure => true,
    :filetype => :gif,
    :size => 120

  # Relationships
  has_one :book_list, :dependent => :destroy
  has_many :line_items, :through => :book_list
  has_many :invites, :foreign_key => :inviter_id
  has_many :activities, :dependent => :destroy

  # New user connection linkages
  has_many :friendships,
    :class_name => "Friendship",
    :foreign_key => "user_id"
  has_many :friends,
    :through => :friendships,
    :conditions => "status = 'accepted'"
  has_many :inverse_friendships,
    :class_name => "Friendship",
    :foreign_key => "friend_id"
  has_many :inverse_friends,
    :through => :inverse_friendships,
    :source => :user
  has_many :pending_friendships,
    :class_name => "Friendship",
    :foreign_key => "user_id",
    :conditions => "status = 'pending'"
  has_many :pending_friends,
    :through => :friendships,
    :source => :friend,
    :conditions => "status = 'pending'"
  has_many :requested_friends,
    :through => :friendships,
    :source => :friend,
    :conditions => "status = 'requested'"

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :users, :first, :last, :email, :password,
    :password_confirmation, :remember_me
end
