module ApiManager
  class FetchTopStoriesIds
    include Executable

    def initialize(limit = 14)
      @uri = ApiManager::UriManager::MainApiUri.execute()
      @limit = limit
    end

    def execute()
      ids = fetch_top_stories_ids_from_api()
      ids ? top_ids = ids[0..@limit] : false
    end

    private

    def fetch_top_stories_ids_from_api()
      begin
        response = RestClient.get("#{@uri}topstories.json")
        ids = JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse
        false
      end
    end
  end
end
