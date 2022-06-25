json.extract! lesson, :id, :name, :lesson_category_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
