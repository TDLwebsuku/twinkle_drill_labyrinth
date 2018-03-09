class AddGenresToItems < ActiveRecord::Migration[5.1]
  def change
  	add_column :items, :genres, :integer
  end
end
