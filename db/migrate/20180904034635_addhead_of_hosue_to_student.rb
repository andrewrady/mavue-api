class AddheadOfHosueToStudent < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :head_of_house, foreign_key: true
  end
end
