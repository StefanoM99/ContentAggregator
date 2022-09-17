json.extract! starred_post, :id, :author, :title, :summary, :created_at, :updated_at
json.url starred_post_url(starred_post, format: :json)
