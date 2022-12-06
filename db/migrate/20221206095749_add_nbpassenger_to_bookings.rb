class AddNbpassengerToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :nb_passenger, :integer
  end
end
