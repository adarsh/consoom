require 'spec_helper'

describe Book do
  subject { Factory(:book) }

  # Associations
  it { should have_many(:line_items) }
  it { should have_many(:recommendations) }

  # Validations
  it { should validate_presence_of :asin }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of(:asin).
    with_message(/ASIN must be unique/) }
  it { should validate_format_of(:image_url).
    with('example.gif') }
  it { should validate_format_of(:image_url).
    not_with('example.doc').
    with_message(/must be a URL for a GIF, JPG, or PNG image/) }

  it "should be invalid without any information" do
    @book = Book.create
    @book.should_not be_valid
  end

  it "should be valid if all fields are full" do
    @book = Book.create!  :title      => "Fake Book Title",
                          :author     => "Albert Einstein",
                          :asin       => "123456789",
                          :image_url  => "image.gif"

    @book.should be_valid
  end

  it "validates uniqueness of the asin" do
    @book = Book.create!  :title      => "Fake Book Title",
                          :author     => "Albert Einstein",
                          :asin       => "123456789",
                          :image_url  => "image.gif"
    @book = Book.create   :title      => "Fake Book Title",
                          :author     => "Albert Einstein",
                          :asin       => "123456789",
                          :image_url  => "image.gif"
    @book.should_not be_valid
  end
end
