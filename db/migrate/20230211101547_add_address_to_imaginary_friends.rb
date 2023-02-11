class AddAddressToImaginaryFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :imaginary_friends, :address, :string
  end
end
