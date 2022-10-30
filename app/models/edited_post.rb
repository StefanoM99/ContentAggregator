class EditedPost < SavedPost
    belongs_to :user
    belongs_to :post
    validates :user_id, uniqueness: {scope: :post_id}
    
    has_one_attached :post_file, :dependent => :destroy
end
