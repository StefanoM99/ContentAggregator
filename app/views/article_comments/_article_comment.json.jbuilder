json.extract! article_comment, :id, :author, :description, :created_at, :updated_at
json.url article_comment_url(article_comment, format: :json)
