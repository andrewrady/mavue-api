class AddDownPaymentAmountToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :downPaymentAmount, :integer
  end
end
