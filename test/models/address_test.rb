require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
    @address = Address.new(street: "123 Main St", suite: "Apt 101", city: "Anytown", zipcode: "12345", user: @user)
  end

  test "should be valid with valid attributes" do
    assert @address.valid?
  end

  test "should be invalid without a street" do
    @address.street = nil
    assert_not @address.valid?
  end

  test "should be invalid without a suite" do
    @address.suite = nil
    assert_not @address.valid?
  end

  test "should be invalid without a city" do
    @address.city = nil
    assert_not @address.valid?
  end

  test "should be invalid without a zipcode" do
    @address.zipcode = nil
    assert_not @address.valid?
  end

  test "should be invalid without a user" do
    @address.user = nil
    assert_not @address.valid?
  end

  test "should belong to a user" do
    assert @address.respond_to?(:user)
  end
end
