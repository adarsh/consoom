class Recommendation < ActiveRecord::Base
  belongs_to :recommendation_request
  belongs_to :book
  belongs_to :recommender_user, :class_name => 'User'
  belongs_to :requestor_user, :class_name => 'User'

  validates_presence_of :recommender_user_id, :requestor_user_id,
            :message => 'Must have all fields filled out [model validation error]'

  validates_uniqueness_of :book_id, :scope => [:recommender_user_id, :requestor_user_id],
                          :message => 'You have already recommended this book to this friend. [Model validation error]'
end
