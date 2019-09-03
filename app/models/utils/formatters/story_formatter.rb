module Utils::Formatters
  class StoryFormatter
    def initialize
      @date_formatter = Utils::Formatters::DateFormatter.new
    end

    def execute(story)
      {
        id: story["id"],
        title: story["title"] || "No title provided",
        url: story["url"] || "#",
        author: story["by"] || "No author provided",
        date: @date_formatter.execute(story["time"]) || "No time provided",
        comments: story["kids"] || [],
        comments_count: story["descendants"] || 0,
      }
    end
  end
end
