class EditedPost < SavedPost
    has_one_attached :post_file, :dependent => :destroy
end
