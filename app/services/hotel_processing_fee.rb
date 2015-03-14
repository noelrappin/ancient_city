class HotelProcessingFee

  attr_accessor :hotel

  def initialize(hotel)
    @hotel = hotel
  end

  def fee
    if hotel.price > 250 then Money.new(1000) else Money.zero end
  end

end
