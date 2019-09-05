module UtilsManager::FormattersManager
  class StoryFormatter
    include Executable

    def initialize(story)
      @story = story
      @date_formatter = UtilsManager::FormattersManager::DateFormatter
    end

    def execute()
      {
        id: @story["id"],
        title: @story["title"] || "No title provided",
        url: @story["url"] || "#",
        author: @story["by"] || "No author provided",
        date: @date_formatter.execute(@story["time"]) || "No time provided",
        comments: @story["kids"] || [],
        comments_count: @story["descendants"] || 0,
      }
    end
  end
end
