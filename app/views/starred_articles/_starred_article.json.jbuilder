json.extract! starred_article, :id, :country, :category, :source, :author, :title, :description, :summary, :link, :media, :publication, :created_at, :updated_at
json.url starred_article_url(starred_article, format: :json)
