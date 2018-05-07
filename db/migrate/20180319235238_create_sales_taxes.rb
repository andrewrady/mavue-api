class CreateSalesTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_taxes do |t|
      t.integer :percent
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
