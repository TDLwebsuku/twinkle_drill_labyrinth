class DropTableItemGenres < ActiveRecord::Migration[5.1]
  def change
  	drop_table :item_genres
  end
end
