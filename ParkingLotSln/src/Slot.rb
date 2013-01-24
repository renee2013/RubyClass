require_relative './Car'

class Slot

	attr_accessor :parking_car #, :slot_no
	
	def initialize(slot_number)
		@parking_car = nil
		#@slot_no = slot_number
	end
	
	def park(car)
		@parking_car = car
	end
	
	def release
		@parking_car = nil
	end

end