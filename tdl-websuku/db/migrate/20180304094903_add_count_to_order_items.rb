class AddCountToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :count, :integer, default: 0
  end
end
