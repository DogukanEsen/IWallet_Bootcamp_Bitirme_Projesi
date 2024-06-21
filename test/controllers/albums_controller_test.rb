require "test_helper"

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @album = albums(:one)  # Örnek bir album fixture'ı
  end

  test "should show album" do
    get album_url(@album)
    assert_response :success
    assert_not_nil assigns(:album)
    assert_not_nil assigns(:album_details)
  end
end
