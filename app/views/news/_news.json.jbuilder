json.extract! news, :id, :by, :text, :url, :title, :created_at, :updated_at
json.url news_url(news, format: :json)
