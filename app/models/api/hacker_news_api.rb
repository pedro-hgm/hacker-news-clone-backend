module Api
  class HackerNewsApi
    def initialize
      @url = "https://hacker-news.firebaseio.com/v0/"
    end

    def get_top_stories_ids
      response = RestClient.get("#{@url}topstories.json")
      JSON.parse(response.body)
    end

    def get_item(id)
      response = RestClient.get("#{@url}item/#{id}.json")
      JSON.parse(response.body)
    end
  end
end
