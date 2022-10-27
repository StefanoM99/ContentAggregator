module PostsHelper
    def meta_inspector(post)
        if (URI.extract(post.summary)!=[])
            URI.extract(post.summary).each do |link|
                if controllo(link)
                    return true
                end
            end
        end
        return false
    end
    def controllo(link)
        @page = MetaInspector.new(link)
        return true
    rescue MetaInspector::RequestError => e
        return false
    end
end