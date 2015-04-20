require './test/test_helper'
require './test/test_helper'
require './test/test_helper'

describe "BooksController", ActionController::TestCase do
  setup do
    @book = books(:one)
    #@line_item = line_items(:john_ruby)
    @update = {
      :isbn => "123456",
      :title => "Fake book name",
      :author => "Clark Kent",
      :image_url => "google.jpg"
    }
  end

  it "should get index" do
    sign_in users(:john)
    get :index
    assert_response :success
    assigns(:books).should.not == nil
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create book" do

    assert_difference('Book.count') do
      post :create, :book => @update
    end

    assert_redirected_to book_path(assigns(:book))
  end

  it "should show book" do
    get :show, :id => @book.to_param
    assert_response :success
  end

  it "should get edit" do
    get :edit, :id => @book.to_param
    assert_response :success
  end

  it "should update book" do
    put :update, :id => @book.to_param, :book => @update
    assert_redirected_to book_path(assigns(:book))
  end

  it "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, :id => @book.to_param
    end

    assert_redirected_to books_path
  end
end
