json.extract! item, :id, :item_name, :price, :artist_name, :item_image_id, :category, :label, :admin_id, :stock, :is_available, :delete_flag, :is_purchased, :created_at, :updated_at
json.url item_url(item, format: :json)
