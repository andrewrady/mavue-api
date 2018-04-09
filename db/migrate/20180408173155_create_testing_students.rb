class CreateTestingStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :testing_students do |t|
      t.references :student, foreign_key: true
      t.references :testing, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :total
      t.integer :form
      t.integer :sparring
      t.integer :weapon
      t.integer :board

      t.timestamps
    end
  end
end
