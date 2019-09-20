module ApiManager
  class FetchLatestStoriesIds
    include Executable

    def initialize(query, limit = 10)
      @uri = ApiManager::UriManager::SecondApiUri.execute()
      @query = query
      @limit = limit
      @id_formatter = UtilsManager::FormattersManager::IdFormatter
      @validate_stories = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
      @http = ApiManager::HttpRequestsCreator
      @log = UtilsManager::LoggerCreator.new(file: "latest_stories_requests.log").logger
    end

    def execute()
      latest_stories = fetch_latest_stories(@query)
      return false unless latest_stories && @validate_stories.execute(latest_stories, Array)
      @id_formatter.execute(latest_stories)
    end

    private

    def fetch_latest_stories(query)
      begin
        response = @http.execute(verb: :get, url: "#{@uri}search_by_date?query=#{query}&tags=story&hitsPerPage=#{@limit}")
        JSON.parse(response.body)["hits"]
      rescue ErrorHandler::RequestError => e
        @log.error("#{e.message} with #{e.action} request")
        false
      end
    end
  end
end
