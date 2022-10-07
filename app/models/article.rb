class Article < ApplicationRecord
    belongs_to :user
    has_many :starred_articles
end
