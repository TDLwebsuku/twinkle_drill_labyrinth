class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :zip_code
      t.string :address
      t.string :phone_number
      t.integer :delete_flag
      t.string :email
      t.string :encrypted_password

      t.timestamps
    end
  end
end
