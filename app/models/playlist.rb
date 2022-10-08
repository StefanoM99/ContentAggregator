class Playlist < ApplicationRecord
    belongs_to :user
    has_many :starred_playlists
    
end
