require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(username: "user", email: "user@example.com", password: "12345678")
  end

  test "user should be valid" do
  	assert @user.valid?
  end

  test "username should be present" do
  	@user.username = "    "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "   "
  	assert_not @user.valid?
  end

  test "password should be present" do
  	@user.password = " " * 8
  	assert_not @user.valid?
  end

  test "password should be at least 8 characters" do
  	@user.password = "a"*6
  	assert_not @user.valid?
  end
end
