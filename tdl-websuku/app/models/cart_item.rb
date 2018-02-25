class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  validates :count, numericality: {greater_than: 0,less_than_or_equal_to: 10 }
end
