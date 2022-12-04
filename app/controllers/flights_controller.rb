class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    # Currently there is no :flight params, only params
    # Probably caused by form_with model: @flight but @flight does not exists
    # @flight = params[:flight] ? Flight.new(flight_params) : Flight.new
    if params[:flight]
      # delete empty params
      params[:flight].delete_if { |k, v| v.empty? || k == :nb_passenger }
      # params[:flight][:start] = params[:flight][:start].to_date.beginning_of_day..params[:flight][:start].to_date.end_of_day if params[:flight][:start]
      params[:flight][:start] = params[:flight][:start].to_date
      @flights = (flight_params.empty? ? Flight.all : Flight.where(flight_params))
                 .includes(:departure_airport, :arrival_airport)
                 .order(:start)
                 .limit(100)
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start)
  end
end
