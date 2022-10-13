class Post < ApplicationRecord
    belongs_to :user
    
    has_one_attached :post_file
end
