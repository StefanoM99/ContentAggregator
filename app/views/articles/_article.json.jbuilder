json.extract! article, :id, :source, :author, :title, :description, :url, :image_url, :publication, :created_at, :updated_at
json.url article_url(article, format: :json)
