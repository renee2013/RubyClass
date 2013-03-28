require_relative '../src/Boy'
require 'minitest/autorun'

class SmartBoyTest < MiniTest::Unit::TestCase
  def test_smart_parking_park_car_in_the_lot_with_most_empty_slots
    test_Boy = Boy.new([ParkingLot.new(3), ParkingLot.new(4)])
    to_park_car1 = Car.new("1")
    ticket = test_Boy.smart_parking(to_park_car1)
    assert_equal 1, ticket.parkingLotNo

    to_park_car1 = Car.new("1")
    ticket = test_Boy.smart_parking(to_park_car1)
    assert_equal 0, ticket.parkingLotNo
  end
end