class Article < ApplicationRecord
    require "uri"
    require "net/http"

    url = URI("https://api.newscatcherapi.com/v2/latest_headlines?countries=IT")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-API-KEY"] = "7edB6EcTDwhM1TGgc6C-XKuutBQPYC09ZJm31svNKs0"

    response = https.request(request)
    data = JSON.parse(response.read_body)

    data["articles"].each do |item|
        Article.create(
            source: item["clean_url"],
            author: item["author"],
            title: item["title"],
            description: item["excerpt"],
            summary: item["summary"],
            link: item["link"],
            media: item["media"],
            country: item["country"],
            language: item["language"],
            topic: item["topic"],
            tw_account: item["twitter_account"],
            publication: item["published_date"]
        )
    end
end
