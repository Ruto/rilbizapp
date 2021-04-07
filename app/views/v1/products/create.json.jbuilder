json.data do
  json.product do
    json.call(
      @product,
      :id,
      :name,
      :desc,
      :type,
      :durable,
      :durability,
      :convenient,
      :resaleable,
      :industrial,
      :internal_trade,
      :active,
      :user_id,
      :created_at,
      :updated_at

    )
  end
end
