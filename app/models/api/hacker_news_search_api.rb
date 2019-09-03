module Api
  class HackerNewsSearchApi
    def initialize()
      @uri = Api::BaseUri.new.get_search_api_base_uri()
      @limit = 10
      @valid_item = Utils::Validators::ValidItens.new
    end

    def fetch_latest_stories(query)
      begin
        response = RestClient.get("#{@uri}search_by_date?query=#{query}&tags=story&hitsPerPage=#{@limit}")
        JSON.parse(response.body)["hits"]
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end

    def get_latest_stories_ids(query)
      stories = self.fetch_latest_stories(query)
      @valid_item.execute(stories, Array) ? self.stories_ids(stories) : false
    end

    def stories_ids(stories)
      stories.map { |story| story["objectID"] }
    end
  end
end
