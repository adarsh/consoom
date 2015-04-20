class BookList < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user
end
