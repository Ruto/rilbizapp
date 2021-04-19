json.extract! price, :id, :priceable_id, :priceable_type, :type, :code_id, :amount, :active, :user_id, :created_at, :updated_at
json.url v1_price_url(price, format: :json)
