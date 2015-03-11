class HomeController < ApplicationController

  def index
    @trips = Trip.all.map { |t| TripPresenter.new(t) }
  end

end
