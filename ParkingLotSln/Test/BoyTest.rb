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

  def test_park_and_get_car_valid
    test_Boy = Boy.new([nil, ParkingLot.new(1), nil, ParkingLot.new(3)])
    assert_equal true, test_Boy.isThereEmptySlotAvailable();

    to_park_car1 = Car.new("11111")
    ticket1 = test_Boy.parking(to_park_car1)
    assert_equal 1, ticket1.parkingLotNo
    assert_equal 1, ticket1.parkingLotTicketNo

    to_park_car2 = Car.new("22222")
    ticket2 = test_Boy.parking(to_park_car2)
    assert_equal 3, ticket2.parkingLotNo
    assert_equal 1, ticket2.parkingLotTicketNo

    got_car = test_Boy.getCar(ticket1)
    assert_equal(got_car, to_park_car1)

    got_car = test_Boy.getCar(ticket2)
    assert_equal(got_car, to_park_car2)
  end

  def test_park_and_get_car_invalid
    test_Boy = Boy.new([nil, ParkingLot.new(1), nil, ParkingLot.new(3)])
    assert_equal true, test_Boy.isThereEmptySlotAvailable();

    to_park_car1 = Car.new("11111")
    ticket = test_Boy.parking(to_park_car1)

    ticketInvalid = BoyTicket.new(ticket.parkingLotNo, ticket.parkingLotTicketNo + 1)
    got_car = test_Boy.getCar(ticketInvalid)
    assert_nil(got_car)

    ticketInvalid = BoyTicket.new(ticket.parkingLotNo + 1, ticket.parkingLotTicketNo)
    got_car = test_Boy.getCar(ticketInvalid)
    assert_nil(got_car)

    ticketInvalid = BoyTicket.new(ticket.parkingLotNo + 1, ticket.parkingLotTicketNo + 1)
    got_car = test_Boy.getCar(ticketInvalid)
    assert_nil(got_car)

    ticketValid = BoyTicket.new(ticket.parkingLotNo, ticket.parkingLotTicketNo)
    got_car = test_Boy.getCar(ticketValid)
    assert_equal(got_car, to_park_car1)
  end

  def test_get_car_twice
    test_Boy = Boy.new([nil, ParkingLot.new(1), nil, ParkingLot.new(3)])
    assert_equal true, test_Boy.isThereEmptySlotAvailable();

    to_park_car1 = Car.new("11111")
    ticket = test_Boy.parking(to_park_car1)
    assert_equal 1, ticket.parkingLotNo
    assert_equal 1, ticket.parkingLotTicketNo

    got_car = test_Boy.getCar(ticket)
    assert_equal(got_car, to_park_car1)

    got_car = test_Boy.getCar(ticket)
    assert_nil(got_car)
  end

  def test_cannotpark_becauseof_no_empty_slot
    test_Boy = Boy.new(nil)
    to_park_car = Car.new("12345")

    ticket = test_Boy.parking(to_park_car)
    assert_nil(ticket)

    test_Boy = Boy.new([])
    ticket = test_Boy.parking(to_park_car)
    assert_nil(ticket)

    test_Boy = Boy.new([ParkingLot.new(0)])
    ticket = test_Boy.parking(to_park_car)
    assert_nil(ticket)

    test_Boy = Boy.new([ParkingLot.new(0), ParkingLot.new(0)])
    ticket = test_Boy.parking(to_park_car)
    assert_nil(ticket)

    test_Boy = Boy.new([ParkingLot.new(0), nil])
    ticket = test_Boy.parking(to_park_car)
    assert_nil(ticket)

    test_Boy = Boy.new([ParkingLot.new(1), nil, ParkingLot.new(2)])
    ticket = test_Boy.parking(to_park_car)
    assert(ticket != nil)
    ticket = test_Boy.parking(to_park_car)
    assert(ticket != nil)
    ticket = test_Boy.parking(to_park_car)
    assert(ticket != nil)
    ticket = test_Boy.parking(to_park_car)
    assert_nil(ticket)
  end

  def test_find_first_parking_lot_with_empty_slots
    test_Boy = Boy.new([ParkingLot.new(0), nil, ParkingLot.new(5), ParkingLot.new(4)])

    parking_lotIndex = test_Boy.find_first_parking_lot_with_empty_slots
    assert_equal 2, parking_lotIndex
  end
end


