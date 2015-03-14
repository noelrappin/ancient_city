class PurchasesOrder

  attr_accessor :length_of_stay

  def initialize(trip_id, hotel_id, activity_ids, length_of_stay, code)
    @trip_id, @hotel_id, @activity_ids = trip_id, hotel_id, activity_ids
    @length_of_stay = length_of_stay
    @code = code
  end

  def trip
    @trip ||= Trip.find(@trip_id)
  end

  def coupon_code
    @coupon_code ||= CouponCode.find_by_code(@code)
  end

  def hotel
    @hotel ||= Hotel.find(@trip_id)
  end

  def activities
    @activities ||= @activity_ids.map { |id| Activity.find(id) }
  end

  def order
    @order ||= Order.new
  end

  def add_line_item(buyable, unit_price, amount, calculator_class)
    OrderLineItemFactory.new(order, buyable, unit_price, amount, coupon_code,
        calculator_class).run
  end

  def calculate_order_price
    order.order_line_items.map(&:price_paid).sum + Money.new(1000)
  end

  def run
    add_line_item(trip, trip.price, 1, TripProcessingFee)
    add_line_item( hotel, hotel.price, length_of_stay.to_i, HotelProcessingFee)
    activities.each do |a|
      add_line_item(a, a.price, 1, ActivityProcessingFee)
    end
    order.total_price_paid = calculate_order_price
    order.save
  end
end
