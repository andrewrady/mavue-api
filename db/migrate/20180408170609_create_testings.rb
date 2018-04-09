class CreateTestings < ActiveRecord::Migration[5.1]
  def change
    create_table :testings do |t|
      t.boolean :complete
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
