class Boy

  def initialize(slotNumber)
    @slotNumber = slotNumber
  end


  def isThereEmptySlotAvailable()
    if (@slotNumber != 0)
      return true
    end
    return false
   end
end