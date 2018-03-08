class RemoveDeleteFlagFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :delete_flag
  end
end
