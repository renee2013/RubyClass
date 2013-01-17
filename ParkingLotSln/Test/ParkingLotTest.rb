require_relative '../src/ParkingLot'
require 'minitest/autorun'


class ParkingLotTest < MiniTest::Unit::TestCase
	def test_get_empty_slot_cnt
		test_parkinglot = ParkingLot.new(0)
		assert_equal 0, test_parkinglot.getEmptySlotsCnt
		
		test_parkinglot = ParkingLot.new(3)
		assert_equal 3, test_parkinglot.getEmptySlotsCnt
		
		test_parkinglot.parking(1)
		assert_equal 2, test_parkinglot.getEmptySlotsCnt
		
		test_parkinglot.getCar(1)
		assert_equal 3, test_parkinglot.getEmptySlotsCnt
		
		test_parkinglot.parking(1)
		assert_equal 2, test_parkinglot.getEmptySlotsCnt
		test_parkinglot.parking(1)
		assert_equal 1, test_parkinglot.getEmptySlotsCnt
		test_parkinglot.parking(1)
		assert_equal 0, test_parkinglot.getEmptySlotsCnt
		test_parkinglot.parking(1)
		assert_equal 0, test_parkinglot.getEmptySlotsCnt
		
		test_parkinglot.getCar(1)
		assert_equal 1, test_parkinglot.getEmptySlotsCnt
	end
end
