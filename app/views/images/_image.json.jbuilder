json.extract! image, :id, :imageable_id, :imageable_type, :img, :created_at, :updated_at
json.url image_url(image, format: :json)
