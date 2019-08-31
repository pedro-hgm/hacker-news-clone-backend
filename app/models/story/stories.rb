module Story
  class Stories
    def initialize
      @main_api = Api::HackerNewsApi.new
      @search_api = Api::HackerNewsSearchApi.new
      @formatter = Helpers::Formatter.new
    end

    def stories_ids()
      ids = @main_api.get_top_stories_ids()
      ids[0..14]
    end

    def stories(ids = self.stories_ids())
      stories = ids.map { |id| @main_api.get_item(id) }
      @formatter.story(stories)
    end

    def story_comments(ids)
      comments = ids.map { |id| @main_api.get_item(id) }
      @formatter.comment(comments)
    end

    def search_stories(query)
      ids = @search_api.get_latest_stories(query)
      self.stories(ids)
    end
  end
end
