class RemoveCountFromCartItems < ActiveRecord::Migration[5.1]
  def change
  	remove_column :cart_items, :count
  end
end
