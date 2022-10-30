class Playlist < ApplicationRecord
  has_many :starred_playlists
  has_many :reported_playlists
  
  has_many :playlist_comments, :dependent => :destroy
  
  serialize :tracks,Array
end
