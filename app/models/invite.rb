class Invite < ActiveRecord::Base
  belongs_to(:inviter, :foreign_key => :inviter_id, :class_name => 'User')
  belongs_to(:invitee, :foreign_key => :invitee_id, :class_name => 'User')


  validates_uniqueness_of :invitee_email, :scope => [:inviter_id],
                          :message => 'You have already invited this person'
end
