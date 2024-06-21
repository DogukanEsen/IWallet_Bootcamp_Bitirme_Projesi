require "test_helper"

class GeoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @address = addresses(:one)
  end

  test "should save geo with lat and lng" do
    geo = Geo.new(
      lat: 40.7128,
      lng: -74.0060,
      address_id: @address.id
    )
    assert geo.save, "Could not save the geo with lat and lng"
  end

  test "should not save geo without lat" do
    geo = Geo.new(
      lng: -74.0060,
      address_id: @address.id
    )
    assert_not geo.save, "Saved the geo without lat"
  end

  test "should not save geo without lng" do
    geo = Geo.new(
      lat: 40.7128,
      address_id: @address.id
    )
    assert_not geo.save, "Saved the geo without lng"
  end
end
