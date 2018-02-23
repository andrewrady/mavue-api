class ChangeTransactionsToSales < ActiveRecord::Migration[5.1]
  def change
    rename_table :transactions, :sales
  end
end
