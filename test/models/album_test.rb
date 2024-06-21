require "test_helper"

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
    @album = Album.new(title: "Sample Album", user: @user)
  end

  test "should be valid with valid attributes" do
    assert @album.valid?
  end

  test "should be invalid without a user" do
    @album.user = nil
    assert_not @album.valid?
  end

  test "should have many album_details" do
    assert @album.respond_to?(:album_details)
  end

  test "should destroy associated album_details" do
    @album.save
    @album.album_details.create!(title: "title")
    assert_difference('AlbumDetail.count', -1) do
      @album.destroy
    end
  end
end
