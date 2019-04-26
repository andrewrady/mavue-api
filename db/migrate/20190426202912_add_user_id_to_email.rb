class AddUserIdToEmail < ActiveRecord::Migration[5.1]
  def change
    add_reference :emails, :user, foreign_key: true
  end
end
