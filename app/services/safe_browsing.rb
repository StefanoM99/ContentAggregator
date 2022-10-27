require "net/http"
require "uri"
require "json"
class SafeBrowsing
    def self.is_it_safe?(myurl)
        res = Array.new
        @service = "https://safebrowsing.googleapis.com/v4/threatMatches:find?key="+Rails.application.credentials[:safe_browsing_key]
        @url_hash = {"url": myurl}
        # HTTP REQUEST
        begin
            uri = URI.parse(@service)
            header = {'Content-Type': 'text/json'}
            body = {
                "client": {
                    "clientId": "contentaggregatorsapienza",
                    "clientVersion": "1.5.2"
                },
                "threatInfo": {
                    "threatTypes": ["MALWARE", "SOCIAL_ENGINEERING"],
                    "platformTypes": ["ANY_PLATFORM"],
                    "threatEntryTypes": ["URL"],
                    "threatEntries": [
                        @url_hash
                    ]
                }
            }
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = (uri.scheme == "https")
            request = Net::HTTP::Post.new(uri.request_uri, header)
            request.body = body.to_json
            response = http.request(request)
        rescue => e
            puts "An error of type '#{e.class}' happened. Error message is '#{e.message}'"
            return "err"
        end
        # RESPONSE HANDLING
        result = JSON.parse(response.body)
        if response.code == "200"
            if result != {}
                return false
                #result["matches"].each do |m|
                #    res.push(m["threat"]["url"])
                #end
            else
                return true
            end
            #return res
        else
            puts result["error"]["code"].to_s + " - " + result["error"]["message"]
            #return "err"
            return false
        end
    end
end