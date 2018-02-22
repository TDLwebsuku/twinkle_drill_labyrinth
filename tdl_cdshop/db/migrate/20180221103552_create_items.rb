class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :price
      t.string :artist_name
      t.string :item_image_id
      t.integer :category
      t.string :label
      t.integer :admin_id
      t.integer :stock
      t.integer :is_available
      t.integer :delete_flag
      t.integer :is_purchased

      t.timestamps
    end
  end
end
