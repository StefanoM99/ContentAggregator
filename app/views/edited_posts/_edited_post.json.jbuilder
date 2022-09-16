json.extract! edited_post, :id, :author, :title, :summary, :created_at, :updated_at
json.url edited_post_url(edited_post, format: :json)
