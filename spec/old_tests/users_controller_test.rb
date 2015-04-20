require './test/test_helper'
require './test/test_helper'
require './test/test_helper'

describe "UsersController", ActionController::TestCase do

  it "should get index" do
    sign_in users(:john)
    get :index
    assert_response :success
  end

end
