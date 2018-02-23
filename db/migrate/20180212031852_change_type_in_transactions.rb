class ChangeTypeInTransactions < ActiveRecord::Migration[5.1]
  def change
    change_column :transactions, :items, :text
  end
end
