class OrdersController < ApplicationController

  def create
    order = Order.new
    order.order_line_items.new(buyable: Trip.find(params[:trip_id]))
    order.order_line_items.new(buyable: Hotel.find(params[:hotel_id]))
    params[:activity_id].each do |aid|
      order.order_line_items.new(buyable: Activity.find(aid))
    end
    order.save
    redirect_to :root
  end

end
