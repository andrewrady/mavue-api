class AddUserToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_reference :programs, :user, foreign_key: true
  end
end
