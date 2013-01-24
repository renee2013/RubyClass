require_relative './Car'

class ParkingLot

	def initialize(slots_cnt)
		puts "In ParkingLot Initialization"
		@empty_slots = slots_cnt
		@occupied_slots = Hash.new(nil)
		@deal_cnt = 0
	end
	
	def getEmptySlotsCnt
		return @empty_slots
	end
	
	def parking(car)
		if (car == nil)
			puts("Invalid Car!")
			return -1
		end
		
		if (@empty_slots <= 0)
			puts("No empty slot can be found!")
			return -1
		else
			@empty_slots -= 1
			@deal_cnt += 1
			@occupied_slots[@deal_cnt] = car 
			puts(car.car_no + " is parked successfully.")
			return @deal_cnt
		end
	end
	
	def getCar(ticket_no)	
		parking_car = @occupied_slots.delete(ticket_no)
		if (parking_car != nil)
			puts(parking_car.car_no + " left.")
			@empty_slots += 1
		else
			puts("Cannot find car for " + ticket_no.to_s + "!")
		end
		
		return parking_car
	end
end