json.extract! sharedpost, :id, :user_id, :posts_id, :date_of_sharing, :created_at, :updated_at
json.url sharedpost_url(sharedpost, format: :json)
