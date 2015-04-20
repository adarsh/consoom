require './test/test_helper'
require './test/test_helper'
require './test/test_helper'

class BookTest < ActiveSupport::TestCase
  test 'book attributes must not be empty' do
    book = Book.new
    assert book.invalid?
    assert book.errors[:isbn].any?
    assert book.errors[:title].any?
    assert book.errors[:author].any?
    assert book.errors[:image_url].any?
  end
  

end
