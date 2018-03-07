class CreateTrackLists < ActiveRecord::Migration[5.1]
  def change
    create_table :track_lists do |t|
      t.string :track_name
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
