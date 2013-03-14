class Boy

  def initialize(number)
    @parkingLotNumber = number
  end


  def isThereEmptySlotAvailable()
    if (@parkingLotNumber != 0)
      return true
    end
    return false
   end
end