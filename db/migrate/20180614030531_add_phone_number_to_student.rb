class AddPhoneNumberToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :phoneNumber, :string
  end
end
