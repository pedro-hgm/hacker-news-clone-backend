module Api
  class HackerNewsSearchApi
    def initialize(url = "https://hn.algolia.com/api/v1/", tags = "story", limit = 10)
      @url = url
      @tags = tags
      @limit = limit
    end

    def get_latest_stories(query)
      response = RestClient.get("#{@url}search_by_date?query=#{query}&tags=#{@tags}&hitsPerPage=#{@limit}")
      self.stories_ids(JSON.parse(response.body)["hits"])
    end

    def stories_ids(stories)
      stories.map { |story| story["objectID"] }
    end
  end
end
