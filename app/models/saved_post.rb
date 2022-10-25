class SavedPost < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_one_attached :post_file, :dependent => :destroy
end
