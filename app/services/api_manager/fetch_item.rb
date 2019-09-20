module ApiManager
  class FetchItem
    include Executable

    def initialize(id = 0)
      @uri = UriManager::MainApiUri.execute()
      @id = id
      @validate_item = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
      @http = ApiManager::HttpRequestsCreator
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
        false
      end
    end
  end
end
