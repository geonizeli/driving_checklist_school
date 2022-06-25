json.extract! subscription, :id, :user_id, :started_at, :concluded_at, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
