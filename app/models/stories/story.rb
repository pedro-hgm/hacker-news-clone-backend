module Stories
  class Story
    def initialize
      @main_api = Api::HackerNewsApi.new
      @search_api = Api::HackerNewsSearchApi.new
      @formatter = Helpers::Formatter.new
    end

    def stories_ids()
      ids = @main_api.get_top_stories_ids()
      ids[0..14]
    end

    def story(id)
      story = @main_api.get_item(id)
      @formatter.story(story)
    end

    def story_comments(id)
      comment = @main_api.get_item(id)
      @formatter.comment(comment)
    end

    def search_stories(query)
      ids = @search_api.get_latest_stories(query)
    end
  end
end
