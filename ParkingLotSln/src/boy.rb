require_relative '../src/ParkingLot'

class Boy

  def initialize(lots)
    @parkingLots = lots
  end


  def isThereEmptySlotAvailable()
    if (@parkingLots == nil)
      return false
    end

    emptySlotsCnt = 0
    for parkingLot in @parkingLots
      if (parkingLot != nil)
        emptySlotsCnt += parkingLot.getEmptySlotsCnt
      end
    end

    return (emptySlotsCnt > 0)
   end
end