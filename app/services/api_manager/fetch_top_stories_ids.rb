module ApiManager
  class FetchTopStoriesIds
    include Executable

    def initialize(limit = 14)
      @uri = ApiManager::UriManager::MainApiUri.execute()
      @limit = limit
      @validate_ids = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
      @http = ApiManager::HttpRequestsCreator
      @log = UtilsManager::LoggerCreator.new(file: "top_stories_requests.log").logger
    end

    def execute()
      ids = fetch_top_stories_ids_from_api()
      return false unless ids && @validate_ids.execute(ids, Array)
      top_ids = ids[0..@limit]
    end

    private

    def fetch_top_stories_ids_from_api()
      begin
        response = @http.execute(verb: :get, url: "#{@uri}topstories.json")
        ids = JSON.parse(response.body)
      rescue ErrorHandler::RequestError => e
        @log.error("#{e.message} with #{e.action} request")
        false
      end
    end
  end
end
