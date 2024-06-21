require "test_helper"

class AlbumDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
    @album = albums(:one)
    @album_detail = AlbumDetail.new(title: "Sample Detail", album: @album)
  end

  test "should be valid with valid attributes" do
    assert @album_detail.valid?
  end


  test "should be invalid without an album" do
    @album_detail.album = nil
    assert_not @album_detail.valid?
  end

  test "should belong to an album" do
    assert @album_detail.respond_to?(:album)
  end
end
