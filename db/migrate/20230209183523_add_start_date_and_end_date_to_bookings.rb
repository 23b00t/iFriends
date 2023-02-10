class AddStartDateAndEndDateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :start_date, :string
    add_column :bookings, :end_date, :string
  end
end
