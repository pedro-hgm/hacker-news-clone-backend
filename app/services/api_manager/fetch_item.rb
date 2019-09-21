module ApiManager
  class FetchItem
    include Executable

    def initialize(id:)
      @uri = UriManager::MainApi::BASE_URI
      @id = id
      @validate_item = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
      @http = HttpRequestsCreator
      @log = UtilsManager::LoggerCreator.new(file: "log/item_requests.log").logger
    end

    def execute()
      item = fetch_item(@id)
      return false unless item && @validate_item.execute(item, Hash)
      item
    end

    private

    def fetch_item(id)
      begin
        response = @http.execute(verb: :get, url: "#{@uri}item/#{id}.json")
        JSON.parse(response.body)
      rescue ErrorHandler::RequestError => e
        @log.error("#{e.message} with #{e.action} request")
        false
      end
    end
  end
end
