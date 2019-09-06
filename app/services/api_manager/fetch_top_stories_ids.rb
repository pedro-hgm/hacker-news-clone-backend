module ApiManager
  class FetchTopStoriesIds
    include Executable

    def initialize(limit = 14)
      @uri = ApiManager::UriManager::MainApiUri.execute()
      @limit = limit
      @validate_ids = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
    end

    def execute()
      ids = fetch_top_stories_ids_from_api()
      return false unless @validate_ids.execute(ids, Array)
      top_ids = ids[0..@limit]
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
