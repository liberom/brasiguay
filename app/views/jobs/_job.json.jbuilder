json.extract! job, :id, :user_id, :title, :modality, :created_at, :updated_at
json.url job_url(job, format: :json)
