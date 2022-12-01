class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def formatted_duration
    Time.at(duration).utc.strftime('%H:%M:%S')
  end
end
