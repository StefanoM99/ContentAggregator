class Profile < ApplicationRecord
    belongs_to :my_posts, class_name: 'MyPost'
    belongs_to :edited_posts, class_name: 'EditedPost'
    belongs_to :starred_posts, class_name: 'StarredPost'
    belongs_to :reported_posts, class_name: 'ReportedPost'

    belongs_to :starred_articles, class_name: 'StarredArticle'
    belongs_to :reported_articles, class_name: 'ReportedArticle'
end
