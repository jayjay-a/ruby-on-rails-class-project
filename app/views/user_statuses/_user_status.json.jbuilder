json.extract! user_status, :id, :user_id, :status_description, :created_at, :updated_at
json.url user_status_url(user_status, format: :json)
