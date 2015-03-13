class TripsController < ApplicationController

  def show
    @trip = Trip.find(params[:id])
  end

end
