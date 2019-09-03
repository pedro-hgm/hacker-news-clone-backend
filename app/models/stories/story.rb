module Stories
  class Story
    def initialize
      @main_api = Api::HackerNewsApi.new
      @search_api = Api::HackerNewsSearchApi.new
      @story_formatter = Utils::Formatters::StoryFormatter.new
    end

    def ids(query = false)
      query ? @search_api.get_latest_stories_ids(query) : @main_api.get_top_stories_ids()
    end

    def show(id)
      story = @main_api.get_item(id)
      story ? @story_formatter.execute(story) : false
    end
  end
end
