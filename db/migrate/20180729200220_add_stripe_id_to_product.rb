class AddStripeIdToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :stripe_id, :string
  end
end
