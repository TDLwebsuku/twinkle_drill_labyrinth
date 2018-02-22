json.extract! order, :id, :user_id, :total_price, :zip_code, :address, :phone_number, :last_name, :first_name, :last_name_kana, :first_name_kana, :created_at, :updated_at
json.url order_url(order, format: :json)
