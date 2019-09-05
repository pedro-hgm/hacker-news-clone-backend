module ApiManager
  class FetchItem
    include Executable

    def initialize(id = 0)
      @uri = ApiManager::UriManager::MainApiUri.execute()
      @id = id
    end

    def execute()
      item = fetch_item(@id)
      item ? item : false
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
