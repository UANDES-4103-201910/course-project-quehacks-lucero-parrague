json.extract! report, :id, :user_id, :post_id, :description, :created_at, :updated_at
json.url report_url(report, format: :json)
