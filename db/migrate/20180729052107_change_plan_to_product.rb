class ChangePlanToProduct < ActiveRecord::Migration[5.1]
  def change
    rename_table :plans, :products
  end
end
