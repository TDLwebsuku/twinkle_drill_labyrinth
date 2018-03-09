class Item < ApplicationRecord
	# gem paranoiaのため
  acts_as_paranoid
  
	has_many :track_lists, dependent: :destroy
	accepts_nested_attributes_for :track_lists, allow_destroy: true
	has_many :order_items
	belongs_to :admin, optional: true
	# optional: trueは、関連先のidを検査しないようにするために必要

	attachment :item_image
	enum category: { シングル: 0, アルバム: 1, ミニアルバム: 2 }
	enum is_available: { 購入可能: 0, 購入不可: 1 }
	enum genres: { ポップ: 0, ロック: 1, レゲエ: 2, ジャズ: 3, クラシック: 4, その他: 5}
end
