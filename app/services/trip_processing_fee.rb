class TripProcessingFee

  attr_accessor :trip

  def initialize(trip)
    @trip = trip
  end

  def year
    trip.start_date.year
  end

  def fee
    Money.new(Time.now.year - year)
  end

end
