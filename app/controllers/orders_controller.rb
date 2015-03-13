class OrdersController < ApplicationController

  def create
    action = PurchasesOrder.new(params[:trip_id], params[:hotel_id], params[:activity_id])
    action.run
    redirect_to :root
  end

end
