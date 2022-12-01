class Airport < ApplicationRecord
  validates :code,
            format: { with: /\A[A-Z]{3}\z/, message: 'only allow 3 capital letters' },
            uniqueness: true,
            presence: true
end
