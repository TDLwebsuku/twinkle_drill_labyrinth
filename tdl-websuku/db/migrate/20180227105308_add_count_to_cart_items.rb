class AddCountToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :count, :integer, default: 0
  end
end
