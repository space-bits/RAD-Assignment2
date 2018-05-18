json.extract! articles, :id, :by, :text, :url, :title, :created_at, :updated_at
json.url articles_url(articles, format: :json)
