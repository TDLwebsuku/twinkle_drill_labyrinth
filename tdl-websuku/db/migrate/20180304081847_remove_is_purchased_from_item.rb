class RemoveIsPurchasedFromItem < ActiveRecord::Migration[5.1]
  def change
  	remove_column :items, :is_purchased
  end
end
