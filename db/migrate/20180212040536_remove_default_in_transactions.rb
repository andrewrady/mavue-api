class RemoveDefaultInTransactions < ActiveRecord::Migration[5.1]
  def change
    change_column :transactions, :items, :text, default: nil
  end
end
