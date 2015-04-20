require './test/test_helper'
require './test/test_helper'
require './test/test_helper'

describe "Book", ActiveSupport::TestCase do
  it 'book attributes must not be empty' do
    book = Book.new
    book.invalid?.should.not == nil
    book.errors[:isbn].any?.should.not == nil
    book.errors[:title].any?.should.not == nil
    book.errors[:author].any?.should.not == nil
    book.errors[:image_url].any?.should.not == nil
  end


end
