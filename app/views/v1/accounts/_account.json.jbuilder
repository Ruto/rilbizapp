json.extract! account, :id, :accountable_id, :accountable_type, :type, :name, :contacts, :memo, :active, :user_id, :created_at, :updated_at
json.url v1_account_url(account, format: :json)
