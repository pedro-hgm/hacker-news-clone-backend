module ApiManager::UriManager
  class SecondApiUri
    include Executable

    def initialize(uri = "https://hn.algolia.com/api/v1/")
      @base_uri = uri
    end

    def execute
      @base_uri
    end
  end
end
