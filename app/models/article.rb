class Article < ApplicationRecord
    require 'open-uri'
    
    url = 'https://newsapi.org/v2/top-headlines?country=&category=&apiKey=77883b129afd489c8ce35414f8946f51'
    uri = URI.parse(url)
    query = Rack::Utils.parse_query(uri.query)

    query["country"] = "it"
    query["category"] = "general"

    uri.query = Rack::Utils.build_query(query)
    optUrl = uri.to_s

    req = URI.open(optUrl)
    response_body = req.read
    data = JSON.parse(response_body)

    data["articles"].each do |item|
        Article.create(
            country: query["country"],
            category: query["category"],
            source: item["source"]["name"],
            author: item["author"],
            title: item["title"],
            description: item["description"],
            summary: item["content"],
            link: item["url"],
            media: item["urlToImage"],
            publication: item["publishedAt"]
        )
    end
end
