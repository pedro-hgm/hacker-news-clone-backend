module Helpers
  class Formatter
    def story(stories)
      stories.map do |story|
        {
          id: story["id"],
          title: story["title"] || "No title provided",
          url: story["url"] || "#",
          author: story["by"] || "No author provided",
          date: self.date(story["time"]),
          comments: story["kids"] || [],
        }
      end
    end

    def comment(comments)
      comments.map do |comment|
        next unless Helpers::Validates.relevant_comment?(comment["text"])
        {
          id: comment["id"],
          author: comment["by"] || "No author provided",
          text: comment["text"],
          date: comment["time"],
          nested: false || comment["kids"],
        }
      end
    end

    def date(date)
      Time.at(date).strftime("%d/%m/%Y %k:%M:%S")
    end
  end
end
