class AddUserToHeadOfHouse < ActiveRecord::Migration[5.1]
  def change
    add_reference :head_of_houses, :user, foreign_key: true
  end
end
