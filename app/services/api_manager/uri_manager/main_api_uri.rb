module ApiManager::UriManager
  class MainApiUri
    include Executable

    def initialize(uri = "https://hacker-news.firebaseio.com/v0/")
      @base_uri = uri
    end

    def execute
      @base_uri
    end
  end
end
