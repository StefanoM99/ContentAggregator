json.extract! reported_post, :id, :author, :title, :summary, :created_at, :updated_at
json.url reported_post_url(reported_post, format: :json)
