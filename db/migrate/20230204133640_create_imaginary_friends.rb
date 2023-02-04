class CreateImaginaryFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :imaginary_friends do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :special_abilities
      t.boolean :rented
      t.integer :price

      t.timestamps
    end
  end
end
