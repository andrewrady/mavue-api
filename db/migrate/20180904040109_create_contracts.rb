class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.date :startDate
      t.date :endDate
      t.integer :lastFour
      t.float :amount
      t.references :head_of_houses, foreign_key: true

      t.timestamps
    end
  end
end
