json.extract! article, :id, :country, :category, :source, :author, :title, :description, :summary, :link, :media, :publication, :created_at, :updated_at
json.url article_url(article, format: :json)
