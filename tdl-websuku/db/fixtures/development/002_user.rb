100.times do |i|
  User.seed_once(:id) do |user|
	user.id = i + 1
	user.email = "#{i+1}a@a"
  user.password = "aaaaaa"
	user.password_confirmation = "aaaaaa"
  user.first_name = "#{i+1}太郎"
  user.last_name = "初期"
  user.first_name_kana = "#{i+1}タロウ"
  user.last_name_kana = "ショキ"
  user.zip_code = "123-4567"
  user.address = "渋谷区"
  user.phone_number = "123-4567-8901"
  user.delete_flag = 0
end
end