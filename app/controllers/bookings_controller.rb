class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:id])
    render new_booking_path if @flight
  end
end
