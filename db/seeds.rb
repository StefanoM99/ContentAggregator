# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# adding some articles
more_articles = [
    {:source => "Al Jazeera English",
        :author => "Al Jazeera",
        :title => "Turkey accuses Greece of ‘hostile action’ against its jets - Al Jazeera English",
        :description => "Radar of a Greek S-300 missile system based on the island of Crete locked on to Turkish fighter jets, state media say.",
        :url => "https://www.aljazeera.com/news/2022/8/28/turkey-says-greek-missiles-locked-on-its-jets-over-mediterranean",
        :image_url => "https://www.aljazeera.com/wp-content/uploads/2022/08/Turkey-1.jpg?resize=1920%2C1440",
        :publication => "29-Aug-2022"},
        
    {:source => "Reuters",
        :author => null,
        :title => "Dollar hits 20-year high as markets hunker down for higher rates for longer - Reuters",
        :description => "The U.S dollar climbed to a 20-year high against other major currencies on Monday after Federal Reserve Chair Jerome Powell signalled interest rates would be kept higher for longer to bring down soaring inflation.",
        :url => "https://www.reuters.com/markets/europe/dollar-gains-investors-brace-higher-rates-2022-08-29/",
        :image_url => "https://www.reuters.com/resizer/aURLx77hfn12ZoYnG6lHjddUCak=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/MMZ3XFL5RBPETA3FNYTXFW4MWA.jpg",
        :publication => "29-Aug-2022"},
        
    {:source => "CBS News",
        :author => "William Harwood",
        :title => "How to watch NASA's Artemis 1 launch to the moon - CBS News",
        :description => "NASA was loading its powerful rocket with fuel overnight. The mission heralds America's return to the moon – and exploration far beyond." ,
        :url => "https://www.cbsnews.com/live-updates/artemis-launch-nasa-moon-mission-how-to-watch-live-stream-2022-08-29/",
        :image_url => "https://assets3.cbsnewsstatic.com/hub/i/r/2022/08/29/5cf61cc6-e8cc-4118-99d2-7401af3e6c71/thumbnail/1200x630/0ea806af0f379d1446a853acf5c0a087/082922-padview1.jpg",
        :publication => "29-Aug-2022"}
]
  
more_articles.each do |article|
  Article.create!(article)
end