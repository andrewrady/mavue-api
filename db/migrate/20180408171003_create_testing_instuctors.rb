class CreateTestingInstuctors < ActiveRecord::Migration[5.1]
  def change
    create_table :testing_instuctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :rank
      t.references :testing, foreign_key: true

      t.timestamps
    end
  end
end
