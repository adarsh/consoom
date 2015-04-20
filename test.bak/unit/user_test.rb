require './test/test_helper'
require './test/test_helper'
require './test/test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  test "add connection" do
    dan = User.find_by_email!("dan_test@example.com")
    current_user= User.find_by_email!("john_test@example.com")
    
    assert current_user.add_connection(dan.id)
    assert current_user.users.include?(dan)
  end

  test "remove connection" do
    dan = User.find_by_email!("dan_test@example.com")
    current_user= User.find_by_email!("john_test@example.com")

    assert current_user.add_connection(dan.id)
    assert current_user.users.include?(dan)
    
    assert current_user.remove_connection(dan.id)
    assert !current_user.users.include?(dan)
  end

end
