module Api
  class HackerNewsSearchApi
    def initialize()
      @uri = Api::BaseUri.new.get_search_api_base_uri()
      @limit = 10
      @valid_item = Utils::Validators::ValidItens.new
      @id_formatter = Utils::Formatters::IdFormatter.new
    end

    def fetch_latest_stories(query)
      begin
        response = RestClient.get("#{@uri}search_by_date?query=#{query}&tags=story&hitsPerPage=#{@limit}")
        JSON.parse(response.body)["hits"]
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end

    def get_latest_stories_ids(query)
      stories = self.fetch_latest_stories(query)
      @valid_item.execute(stories, Array) ? @id_formatter.execute(stories) : false
    end
  end
end
