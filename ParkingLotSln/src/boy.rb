require_relative '../src/ParkingLot'
require_relative '../src/boy_ticket'

class Boy

  def initialize(lots)
    @parkingLots = lots
  end

  def isThereEmptySlotAvailable()
    if (@parkingLots == nil)
      return false
    end

    for parkingLot in @parkingLots
      if (parkingLot != nil)
        if (parkingLot.getEmptySlotsCnt > 0)
          return true
        end
      end
    end

    return false
  end

  def smart_parking(car)
    if ((@parkingLots == nil) || (@parkingLots.length <= 0))
      return nil
    end

    maxEmptySlotsLotIndex = find_parking_lot_with_most_empty_slots()

    if (maxEmptySlotsLotIndex < 0)
      return nil
    end

    ticketNo = @parkingLots[maxEmptySlotsLotIndex].parking(car)
    return BoyTicket.new(maxEmptySlotsLotIndex, ticketNo)
  end

  def find_parking_lot_with_most_empty_slots
    i = 0
    maxEmptySlotsLotIndex = -1
    currentMaxEmptySlots = 0
    for parkingLot in @parkingLots
      if (parkingLot != nil)
        emptySlots = parkingLot.getEmptySlotsCnt
        if (emptySlots > currentMaxEmptySlots)
          currentMaxEmptySlots = emptySlots
          maxEmptySlotsLotIndex = i
        end
      end
      i += 1
    end
    maxEmptySlotsLotIndex
  end

  def parking(car)
    if ((@parkingLots == nil) || (@parkingLots.length <= 0))
      return nil
    end

    i = 0
    for parkingLot in @parkingLots
      if (parkingLot != nil)
        ticketNo = parkingLot.parking(car)
        if (ticketNo >= 0)
          return BoyTicket.new(i, ticketNo)
        end
      end
      i += 1
    end

    return nil
  end

  def getCar(boyTicket)
    if ((boyTicket == nil) ||
        (@parkingLots == nil) ||
        (boyTicket.parkingLotNo >= @parkingLots.length) ||
        (@parkingLots[boyTicket.parkingLotNo] == nil))
      return nil
    end

    return @parkingLots[boyTicket.parkingLotNo].getCar(boyTicket.parkingLotTicketNo)
  end

end