class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.float :price
      t.string :interval
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
