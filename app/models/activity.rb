class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :source, :polymorphic => true

  validates_presence_of :user_id, :source_type, :source

  default_scope :order => 'activities.created_at DESC', :limit => 25

  class << self
    def add(user_id, source_type, source)
      return false if user_id.blank? or source_type.blank? or source.blank?
      activity = Activity.new(:user_id        => user_id,
                              :source_type    => source_type,
                              :source         => source)
      activity.save!
    end
  end
end
