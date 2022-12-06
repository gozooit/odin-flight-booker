class FlightsController < ApplicationController
  # rubocop:disable Metrics
  def index
    @flight = Flight.new
    return unless params[:flight]

    @nb_passenger = params[:flight][:nb_passenger]
    params[:flight].delete_if { |k, v| v.empty? || k == :nb_passenger }
    query = flight_params
    query[:start] = query[:start].to_date.all_day if query[:start]
    return @flights = Flight.all if query.empty?

    @flights = Flight.where(query)
                     .includes(:departure_airport, :arrival_airport)
                     .order(:start)
                     .limit(100)
  end
  # rubocop:enable Metrics

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start)
  end
end
