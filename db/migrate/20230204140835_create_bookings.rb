class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :imaginary_friend, null: false, foreign_key: true
      t.integer :approved

      t.timestamps
    end
  end
end
