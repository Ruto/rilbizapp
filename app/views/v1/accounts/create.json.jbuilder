json.data do
  json.account do
    json.call(
      @account,
      :id,
      :accountable_id,
      :accountable_type,
      :type,
      :name,
      :contacts,
      :memo,
      :active,
      :user_id,
      :created_at,
      :updated_at

    )
  end
end
