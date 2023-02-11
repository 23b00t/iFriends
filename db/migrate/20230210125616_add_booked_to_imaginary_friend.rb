class AddBookedToImaginaryFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :imaginary_friends, :booked, :text, array: true, default: []
  end
end
