class AddDownPaymentToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :downPayment, :float
  end
end
