json.extract! post_history, :id, :action, :date, :user_id, :post_id, :created_at, :updated_at
json.url post_history_url(post_history, format: :json)
