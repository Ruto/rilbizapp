json.data do
  json.price do
    json.call(
      @price,
      :id,
      :priceable_id,
      :priceable_type,
      :type, :code_id,
      :amount,
      :active,
      :user_id,
      :created_at,
      :updated_at

    )
  end
end
