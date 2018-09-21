class CreateHeadOfHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :head_of_houses do |t|
      t.string :firstName
      t.string :lastName
      t.string :state 
      t.string :address
      t.integer :zip
      t.string :email
      t.string :phoneNumber

      t.timestamps
    end
  end
end
