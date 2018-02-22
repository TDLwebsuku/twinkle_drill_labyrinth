class CreateTrackLists < ActiveRecord::Migration[5.1]
  def change
    create_table :track_lists do |t|
      t.integer :item_id
      t.string :track_name

      t.timestamps
    end
  end
end
