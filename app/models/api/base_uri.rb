module Api
  class BaseUri
    def initialize
      @search_api_base_uri = "https://hn.algolia.com/api/v1/"
      @main_api_base_uri = "https://hacker-news.firebaseio.com/v0/"
    end

    def get_main_api_base_uri
      @main_api_base_uri
    end

    def get_search_api_base_uri
      @search_api_base_uri
    end
  end
end
