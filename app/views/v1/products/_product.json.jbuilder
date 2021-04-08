json.extract! product, :id, :name, :desc, :type, :category, :durable, :durability, :convenient, :resaleable, :industrial, :internal_trade, :active, :user_id, :created_at, :updated_at
json.url v1_product_url(product, format: :json)
