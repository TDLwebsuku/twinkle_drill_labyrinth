class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :user
	enum is_purchased: { 受付中: 0, 出荷準備中: 1, 出荷済: 2 }
end
