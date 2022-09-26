json.extract! saved_playlist, :id, :type, :name, :description, :spotify_url, :spotify_img, :created_at, :updated_at
json.url saved_playlist_url(saved_playlist, format: :json)
