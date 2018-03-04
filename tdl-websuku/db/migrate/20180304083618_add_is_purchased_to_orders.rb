class AddIsPurchasedToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :is_purchased, :integer, default: 0
  end
end
