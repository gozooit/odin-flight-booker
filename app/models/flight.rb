class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings

  attr_accessor :nb_passenger

  def formatted_duration
    Time.at(duration).utc.strftime('%H:%M:%S')
  end

  def formatted_date
    start.strftime('%Y/%m/%d')
  end

  def day_range_date
    (start.beginnig_of_day..start.end_of_day)
  end
end
