class AddInstructorStatusToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :Instructor, :boolean
  end
end
