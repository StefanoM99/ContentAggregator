json.extract! reported_article, :id, :country, :category, :source, :author, :title, :description, :summary, :link, :media, :publication, :created_at, :updated_at
json.url reported_article_url(reported_article, format: :json)
