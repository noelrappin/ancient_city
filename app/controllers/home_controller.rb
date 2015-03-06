class HomeController < ApplicationController

  def index
    @trips = Trip.all
  end

end
