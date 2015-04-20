require './test/test_helper'
require './test/test_helper'
require './test/test_helper'

describe "User", ActiveSupport::TestCase do
  fixtures :users

  it "add connection" do
    dan = User.find_by_email!("dan_test@example.com")
    current_user= User.find_by_email!("john_test@example.com")

    current_user.add_connection(dan.id).should.not == nil
    current_user.users.include?(dan).should.not == nil
  end

  it "remove connection" do
    dan = User.find_by_email!("dan_test@example.com")
    current_user= User.find_by_email!("john_test@example.com")

    current_user.add_connection(dan.id).should.not == nil
    current_user.users.include?(dan).should.not == nil

    current_user.remove_connection(dan.id).should.not == nil
    current_user.users.include?(dan).should.not == true
  end

end
