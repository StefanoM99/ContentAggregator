class Article < ApplicationRecord
  has_many :starred_articles
  has_many :reported_articles
  
  has_many :article_comments
end
