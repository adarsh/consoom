require './test/test_helper'
require './test/test_helper'
require './test/test_helper'

describe "MainController", ActionController::TestCase do
  it "should get index" do
    get :index
    assert_response :success
  end

end
