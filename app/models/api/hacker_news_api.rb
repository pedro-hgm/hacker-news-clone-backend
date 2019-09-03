module Api
  class HackerNewsApi
    def initialize
      @uri = Api::BaseUri.new.get_main_api_base_uri()
      @valid_item = Utils::Validators::ValidItens.new
    end

    def fetch_top_stories_ids
      begin
        response = RestClient.get("#{@uri}topstories.json")
        ids = JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end

    def get_top_stories_ids
      ids = self.fetch_top_stories_ids
      @valid_item.execute(ids, Array) ? top_15_ids = ids[0..14] : false
    end

    def fetch_item(id)
      begin
        response = RestClient.get("#{@uri}item/#{id}.json")
        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end

    def get_item(id)
      item = self.fetch_item(id)
      item["id"] ? item : false
    end
  end
end
