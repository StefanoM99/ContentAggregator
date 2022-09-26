json.extract! playlist, :id, :name, :description, :spotify_url, :spotify_img, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
