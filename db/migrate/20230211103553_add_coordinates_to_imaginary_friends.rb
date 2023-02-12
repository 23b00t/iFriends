class AddCoordinatesToImaginaryFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :imaginary_friends, :latitude, :float
    add_column :imaginary_friends, :longitude, :float
  end
end
