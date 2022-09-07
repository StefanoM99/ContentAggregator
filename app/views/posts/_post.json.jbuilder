json.extract! post, :id, :author, :title, :summary, :created_at, :updated_at
json.url post_url(post, format: :json)
