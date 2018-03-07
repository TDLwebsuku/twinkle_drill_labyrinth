User.seed_once(:id) do |user|
	user.id = 1
	user.email = "a@a"
  user.password = "aaaaaa"
	user.password_confirmation = "aaaaaa"
  user.first_name = "太郎"
  user.last_name = "初期"
  user.first_name_kana = "タロウ"
  user.last_name_kana = "ショキ"
  user.zip_code = "123-4567"
  user.address = "渋谷区"
  user.phone_number = "123-4567-8901"
  user.delete_flag = 0
end