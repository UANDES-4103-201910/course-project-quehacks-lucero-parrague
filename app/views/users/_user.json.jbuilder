json.extract! user, :id, :admin_level, :name, :last_name, :email, :password, :picture, :biography, :gps, :city, :country, :created_at, :updated_at
json.url user_url(user, format: :json)
