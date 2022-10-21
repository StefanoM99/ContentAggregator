class Post < ApplicationRecord
  has_many :my_posts
  has_many :edited_posts
  has_many :starred_posts
  has_many :reported_posts
  
  has_many :post_comments
    
  has_one_attached :post_file, :dependent => :destroy
end
