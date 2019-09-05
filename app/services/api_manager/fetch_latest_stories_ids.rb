module ApiManager
  class FetchLatestStoriesIds
    include Executable

    def initialize(query, limit = 10)
      @uri = ApiManager::UriManager::SecondApiUri.execute()
      @query = query
      @limit = limit
      @id_formatter = UtilsManager::FormattersManager::IdFormatter
    end

    def execute()
      latest_stories = fetch_latest_stories(@query)
      latest_stories ? @id_formatter.execute(latest_stories) : false
    end

    private

    def fetch_latest_stories(query)
      begin
        response = RestClient.get("#{@uri}search_by_date?query=#{query}&tags=story&hitsPerPage=#{@limit}")
        JSON.parse(response.body)["hits"]
      rescue RestClient::ExceptionWithResponse
        false
      end
    end
  end
end
