module ApiManager
  class FetchItem
    include Executable

    def initialize(id = 0)
      @uri = ApiManager::UriManager::MainApiUri.execute()
      @id = id
      @validate_item = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
    end

    def execute()
      item = fetch_item(@id)
      return false unless @validate_item.execute(item, Hash)
      item
    end

    private

    def fetch_item(id)
      begin
        response = RestClient.get("#{@uri}item/#{id}.json")
        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse
        false
      end
    end
  end
end
