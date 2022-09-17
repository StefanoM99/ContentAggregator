class Feed < ApplicationRecord
    belongs_to :articles, class_name: 'Article'
    belongs_to :forecasts, class_name: 'Forecast'
    belongs_to :posts, class_name: 'Post'
end
