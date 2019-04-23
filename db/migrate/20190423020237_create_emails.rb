class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :name
      t.string :email
      t.text :message
      t.boolean :read

      t.timestamps
    end
  end
end
