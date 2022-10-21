class Playlist < ApplicationRecord
  has_many :starred_playlists
  has_many :reported_playlists
  
  has_many :playlist_comments
  
  serialize :tracks,Array
end
