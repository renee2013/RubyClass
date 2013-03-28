require_relative '../src/ParkingLot'
require 'minitest/autorun'


class ParkingLotTest < MiniTest::Unit::TestCase
	def test_get_empty_slot_cnt
		test_parkinglot = ParkingLot.new(0)
		assert_equal 0, test_parkinglot.getEmptySlotsCnt
		
		test_parkinglot = ParkingLot.new(3)
		assert_equal 3, test_parkinglot.getEmptySlotsCnt
	end
	
	def test_park_and_get_car_valid				
		test_parkinglot = ParkingLot.new(3)
		
		to_park_car1 = Car.new("11111")
		ticket_no1 = test_parkinglot.parking(to_park_car1)
		assert_equal 2, test_parkinglot.getEmptySlotsCnt
		
		to_park_car2 = Car.new("22222")
		ticket_no2 = test_parkinglot.parking(to_park_car2)
		assert_equal 1, test_parkinglot.getEmptySlotsCnt
		
		got_car = test_parkinglot.getCar(ticket_no2)
		assert_equal(got_car, to_park_car2)
		assert_equal 2, test_parkinglot.getEmptySlotsCnt
		
		got_car = test_parkinglot.getCar(ticket_no1)
		assert_equal(got_car, to_park_car1)
		assert_equal 3, test_parkinglot.getEmptySlotsCnt
	end
	
	def test_park_and_get_car_invalid	
		test_parkinglot = ParkingLot.new(3)
		
		to_park_car = Car.new("12345")
		ticket_no = test_parkinglot.parking(to_park_car)
		
		got_car = test_parkinglot.getCar(ticket_no + 1)
		assert_nil(got_car)
	end
	
	def test_get_car_twice	
		test_parkinglot = ParkingLot.new(3)
		
		to_park_car = Car.new("12345")
		ticket_no = test_parkinglot.parking(to_park_car)
		
		got_car = test_parkinglot.getCar(ticket_no)
		assert_equal(got_car, to_park_car)
		
		got_car = test_parkinglot.getCar(ticket_no)
		assert_nil(got_car)
	end
	
	def test_cannotpark_becauseof_no_empty_slot	
		test_parkinglot = ParkingLot.new(0)
		
		to_park_car = Car.new("12345")
		ticket_no = test_parkinglot.parking(to_park_car)
		assert_equal(-1, ticket_no)				
		
		test_parkinglot = ParkingLot.new(3)		
		to_park_car = Car.new("12345")
		
		ticket_no = test_parkinglot.parking(to_park_car)
		assert_equal(1, ticket_no)
		ticket_no = test_parkinglot.parking(to_park_car)
		assert_equal(2, ticket_no)
		ticket_no = test_parkinglot.parking(to_park_car)
		assert_equal(3, ticket_no)
		ticket_no = test_parkinglot.parking(to_park_car)
		assert_equal(-1, ticket_no)
	end
end


