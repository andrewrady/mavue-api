class AddEmgwayDataToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :maskedPan, :string
    add_column :sales, :cardType, :string
    add_column :sales, :lastFour, :string
    add_column :sales, :referenceNumber, :string
    add_column :sales, :authCode, :string
    add_column :sales, :authResponse, :string
  end
end
