class AddRankToTestingStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :testing_students, :rank, :string
  end
end
