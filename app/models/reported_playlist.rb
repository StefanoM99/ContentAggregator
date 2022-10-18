class ReportedPlaylist < SavedPlaylist
    belongs_to :user
    belongs_to :playlist
    has_many :blacklist
    validates :user_id, uniqueness: {scope: :playlist_id}
end
