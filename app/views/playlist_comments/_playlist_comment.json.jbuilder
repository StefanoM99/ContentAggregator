json.extract! playlist_comment, :id, :author, :description, :created_at, :updated_at
json.url playlist_comment_url(playlist_comment, format: :json)
