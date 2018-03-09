class DropTableTrackLists < ActiveRecord::Migration[5.1]
  def change
  	drop_table :track_lists
  end
end
