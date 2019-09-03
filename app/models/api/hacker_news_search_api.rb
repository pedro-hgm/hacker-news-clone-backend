module Api
  class HackerNewsSearchApi
    def initialize()
      @base_uri = Api::BaseUri.new
      @uri = @base_uri.get_search_api_base_uri()
      @limit = 10
      @validator = Utils::Validator.new
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
      @validator.valid_itens?(stories, Array) ? self.stories_ids(stories) : false
    end

    def stories_ids(stories)
      stories.map { |story| story["objectID"] }
    end
  end
end
