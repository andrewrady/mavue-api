class AddTokenToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :token, :string
  end
end
