class Item < ApplicationRecord
	has_many :track_lists
	has_many :item_genres
	has_many :order_items
	has_many :cart_items
	belongs_to :admin
end
