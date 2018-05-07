class AddSizeToTestingStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :testing_students, :size, :string
  end
end
