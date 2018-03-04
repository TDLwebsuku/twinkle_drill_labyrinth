class Item < ApplicationRecord
	has_many :track_lists
	has_many :item_genres
	has_many :order_items
	belongs_to :admin, optional: true
	# optional: trueは、関連先のidを検査しないようにするために必要

	attachment :item_image
	enum category: { シングル: 0, アルバム: 1, ミニアルバム: 2 }
	enum is_available: { 購入可能: 0, 購入不可: 1 }
end
