class RemoveCountFromOrderItems < ActiveRecord::Migration[5.1]
  def change
  	remove_column :order_items, :count
  end
end
