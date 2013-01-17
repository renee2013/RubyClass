require_relative '../src/Slot'

class ParkingLot

	def initialize(slots_cnt)
		puts "In ParkingLot Initialization"
		@empty_slots = slots_cnt
		@occupied_slots = 0
	end
	
	def getEmptySlotsCnt
		return @empty_slots
	end
	
	def parking(car)
		if (@empty_slots <= 0)
			return -1
		else
			@empty_slots -= 1
			@occupied_slots += 1
			return 999999999999
		end
	end
	
	def getCar(ticket_no)
		if (@occupied_slots <= 0)
			return -1
		else
			@empty_slots += 1
			@occupied_slots -= 1
			return 999999999999
		end
	end
end