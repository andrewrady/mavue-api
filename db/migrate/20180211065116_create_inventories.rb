class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :item_number
      t.string :name
      t.float :price
      t.boolean :tax

      t.timestamps
    end
  end
end
