class RemoveColumnBookedFormImaginaryFriends < ActiveRecord::Migration[7.0]
  def change
    remove_column :imaginary_friends, :booked
  end
end
