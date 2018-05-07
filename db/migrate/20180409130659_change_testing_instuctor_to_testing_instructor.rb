class ChangeTestingInstuctorToTestingInstructor < ActiveRecord::Migration[5.1]
  def change
    rename_table :testing_instuctors, :testing_instructors
  end
end
