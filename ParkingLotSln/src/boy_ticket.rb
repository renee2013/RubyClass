class BoyTicket
  attr_accessor :parkingLotNo
  attr_accessor :parkingLotTicketNo

  def initialize(lotNo, ticketNo)
    @parkingLotNo = lotNo
    @parkingLotTicketNo = ticketNo
  end# To change this template use File | Settings | File Templates.
end