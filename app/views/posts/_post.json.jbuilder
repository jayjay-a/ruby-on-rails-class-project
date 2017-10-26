json.extract! post, :id, :name, :date, :board_id, :created_at, :updated_at
json.url post_url(post, format: :json)
