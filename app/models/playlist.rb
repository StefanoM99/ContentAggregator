class Playlist < ApplicationRecord
    
    has_many :starred_playlists
    
    serialize :tracks,Array
end
