module ApplicationHelper
	# ページごとの完全なタイトルを返します
	def full_title(page_title = "")
		base_title = "TDL"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def total_price
		current_cart.cart_items.each do|cart_item|
			@total_price += cart_item.count * cart_item.item.total_price
		end
		@total_price.to_i
	end
end
