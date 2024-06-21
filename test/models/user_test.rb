require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user without name" do
    user = User.new(username: "testuser", email: "test@example.com")
    assert_not user.save, "Saved the user without a name"
  end

  test "should not save user without username" do
    user = User.new(name: "Test User", email: "test@example.com")
    assert_not user.save, "Saved the user without a username"
  end

  test "should not save user without email" do
    user = User.new(name: "Test User", username: "testuser")
    assert_not user.save, "Saved the user without an email"
  end

  test "should save user with all required fields" do
    user = User.new(name: "Test User", username: "testuser", email: "test@example.com")
    assert user.save, "Could not save the user with all required fields"
  end
end
