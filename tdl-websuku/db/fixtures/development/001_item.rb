100.times do |i|
	Item.seed_once(:id) do |item|
		item.id = i + 1
		item.item_name =  "#{i + 1}番目の初期データ"
		item.price = (i + 1) * 1000
		item.artist_name = "#{i + 1}番目のロッカー"
		item.category = 1
		item.label = "TDL"
		item.admin_id = 1
		item.genres = 1
    item.stock = 100
    item.is_available = 0
    # item.delete_flag = 0
    item.item_image = Rails.root.join("public/no_image.jpg").open
	end
end