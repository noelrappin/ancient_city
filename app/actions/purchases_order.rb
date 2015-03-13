class PurchasesOrder

  def initialize(trip_id, hotel_id, activity_ids)
    @trip_id, @hotel_id, @activity_ids = trip_id, hotel_id, activity_ids
  end

  def trip
    @trip ||= Trip.find(@trip_id)
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

  def add_line_item(buyable)
    order.order_line_items.new(buyable: buyable)
  end

  def run
    add_line_item(trip)
    add_line_item(hotel)
    activities.each { |a| add_line_item(a) }
    order.save
  end
end
