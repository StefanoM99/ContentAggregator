class Post < ApplicationRecord

    has_one_attached :image
    has_one_attached :video
end
