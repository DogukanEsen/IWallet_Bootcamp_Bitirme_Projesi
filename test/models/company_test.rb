require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
    @company = Company.new(name: "Example Inc.", catchPhrase: "Lorem ipsum", bs: "Lorem ipsum", user: @user)
  end

  test "should be valid with all attributes" do
    assert @company.valid?
  end

  test "should be invalid without a name" do
    @company.name = nil
    assert_not @company.valid?
    assert_includes @company.errors[:name], "can't be blank"
  end

  test "should be invalid without a catchPhrase" do
    @company.catchPhrase = nil
    assert_not @company.valid?
    assert_includes @company.errors[:catchPhrase], "can't be blank"
  end

  test "should be invalid without a bs" do
    @company.bs = nil
    assert_not @company.valid?
    assert_includes @company.errors[:bs], "can't be blank"
  end

  test "should be invalid without a user" do
    @company.user = nil
    assert_not @company.valid?
    assert_includes @company.errors[:user], "must exist"
  end
end
