class FlightsController < ApplicationController
  def index
    # Currently there is no :flight params, only params
    # Probably caused by form_with model: @flight but @flight does not exists
    # @flight = params[:flight] ? Flight.new(flight_params) : Flight.new
    if params[:flight]
      # delete empty params
      flight_params.delete_if { |k, v| v.empty? || k == 'nb_passenger' }
      @flights = (flight_params.empty? ? Flight.all : Flight.where(flight_params)).includes(:departure_airport, :arrival_airport).order(:start).limit(100)
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start, :duration)
  end
end