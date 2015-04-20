class RecommendationRequest < ActiveRecord::Base
  belongs_to :requestor_user, :class_name => 'User'
  belongs_to :recommender_user, :class_name => 'User'
  has_many :recommendations
end
