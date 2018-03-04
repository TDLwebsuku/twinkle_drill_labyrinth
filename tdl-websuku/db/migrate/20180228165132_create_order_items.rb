class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :count
      t.string :item_name
      t.integer :price
      t.string :artist_name
      t.string :label

      t.timestamps
    end
  end
end
