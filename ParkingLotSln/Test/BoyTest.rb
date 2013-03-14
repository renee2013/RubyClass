require_relative '../src/Boy'
require 'minitest/autorun'


class BoyTest < MiniTest::Unit::TestCase
  def test_get_is_there_empty_slot_available_right_after_initialized
    test_Boy = Boy.new(nil)
    assert_equal false, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new([])
    assert_equal false, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new([ParkingLot.new(0)])
    assert_equal false, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new([ParkingLot.new(0), ParkingLot.new(0)])
    assert_equal false, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new([ParkingLot.new(0), nil])
    assert_equal false, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new([ParkingLot.new(2)])
    assert_equal true, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new([ParkingLot.new(1), ParkingLot.new(3)])
    assert_equal true, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new([ParkingLot.new(1), nil, ParkingLot.new(3)])
    assert_equal true, test_Boy.isThereEmptySlotAvailable();
  end
end


