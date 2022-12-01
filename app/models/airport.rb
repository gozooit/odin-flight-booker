class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: :departure_airport_id, dependent: :destroy
  has_many :arriving_flights, class_name: 'Flight', foreign_key: :arrival_airport, dependent: :destroy

  validates :code,
            format: { with: /\A[A-Z]{3}\z/, message: 'only allow 3 capital letters' },
            uniqueness: true,
            presence: true
end
