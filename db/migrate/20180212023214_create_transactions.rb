class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :items, array: true, default: '{}'
      t.float :total
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
