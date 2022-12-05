class FlightsController < ApplicationController

  # def index
  #   @flight = Flight.new
  #   if params[:flight].empty?
  #     @flights = Flight.all
  #   else
  #     # delete empty params
  #     params[:flight].delete_if { |k, v| v.empty? || k == :nb_passenger }
  #     # params[:flight][:start] = params[:flight][:start].to_date.beginning_of_day..params[:flight][:start].to_date.end_of_day if params[:flight][:start]
  #     flight_params[:start] = params[:flight][:start].to_date.all_day
  #     @flights = Flight.where(departure_airport_id: flight_params[:departure_airport_id])
  #                      .includes(:departure_airport, :arrival_airport)
  #                      .order(:start)
  #                      .limit(100)
  #   end
  # end

  # rubocop:disable Metrics
  def index
    @flight = Flight.new
    return unless params[:flight]

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

  def new
    @flight = Flight.new
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start)
  end
end
