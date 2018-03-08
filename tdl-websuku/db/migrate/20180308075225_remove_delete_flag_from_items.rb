class RemoveDeleteFlagFromItems < ActiveRecord::Migration[5.1]
  def change
  	remove_column :items, :delete_flag
  end
end
