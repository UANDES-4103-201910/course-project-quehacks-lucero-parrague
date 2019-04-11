json.extract! post, :id, :title, :description, :public_date, :city, :country, :gps, :pictures, :files, :open_or_closed, :solved, :visible, :dumpster, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
