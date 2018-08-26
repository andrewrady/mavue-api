class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.integer :duration

      t.timestamps
    end
  end
end
