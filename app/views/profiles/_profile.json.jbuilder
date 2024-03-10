json.extract! profile, :id, :first_name, :last_name, :currency, :user_id, :language, :created_at, :updated_at
json.url profile_url(profile, format: :json)
