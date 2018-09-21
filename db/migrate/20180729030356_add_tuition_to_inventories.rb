class AddTuitionToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :tuition, :boolean
  end
end
