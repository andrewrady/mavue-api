class ChangeNameOfReferencesInContracts < ActiveRecord::Migration[5.1]
  def change
    rename_column :contracts, :head_of_houses_id, :head_of_house_id
  end
end
