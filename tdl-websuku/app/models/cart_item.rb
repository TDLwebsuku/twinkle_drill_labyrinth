class CartItem < ApplicationRecord
	belongs_to :cart
	balongs_to :item
end
