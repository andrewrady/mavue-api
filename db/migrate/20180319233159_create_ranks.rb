class CreateRanks < ActiveRecord::Migration[5.1]
  def change
    create_table :ranks do |t|
      t.string :name
      t.integer :order
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
