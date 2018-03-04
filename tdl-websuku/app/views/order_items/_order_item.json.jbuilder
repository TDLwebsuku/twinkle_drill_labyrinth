json.extract! order_item, :id, :order_id, :item_id, :count, :item_name, :price, :artist_name, :label, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
