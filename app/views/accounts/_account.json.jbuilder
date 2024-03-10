json.extract! account, :id, :user_id, :activation, :expiration, :plan, :created_at, :updated_at
json.url account_url(account, format: :json)
