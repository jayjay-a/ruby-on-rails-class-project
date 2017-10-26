json.extract! board, :id, :name, :date, :channel_id, :created_at, :updated_at
json.url board_url(board, format: :json)
