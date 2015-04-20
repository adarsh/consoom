class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :book_list
  has_one :activity, :as => :source

  validates :book_id, :book_list_id, :presence => true

  #ensures a unique combination of book_id and book_list_id
  validates_uniqueness_of :book_list_id, :scope => :book_id,
                          :message => 'This book is already in your favorites list.'

  validates_length_of :blurb, :maximum => 140, :message => 'Blurb must be <140 characters'
end
