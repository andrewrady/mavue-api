class AddPriceToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :price, :float
  end
end
