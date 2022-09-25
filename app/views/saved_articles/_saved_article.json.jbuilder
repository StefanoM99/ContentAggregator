json.extract! saved_article, :id, :type, :country, :category, :source, :author, :title, :description, :summary, :link, :media, :publication, :created_at, :updated_at
json.url saved_article_url(saved_article, format: :json)
