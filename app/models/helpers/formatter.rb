module Helpers
  class Formatter
    def story(story)
      {
        id: story["id"],
        title: story["title"] || "No title provided",
        url: story["url"] || "#",
        author: story["by"] || "No author provided",
        date: self.date(story["time"]),
        comments: story["kids"] || [],
        comments_count: story["descendants"],
      }
    end

    def comment(comment)
      return unless comment["text"] && Helpers::Validates.relevant_comment?(comment["text"])
      {
        id: comment["id"],
        author: comment["by"] || "No author provided",
        text: comment["text"],
        date: self.date(comment["time"]),
        nested: false || comment["kids"],
      }
    end

    def date(date)
      Time.at(date).strftime("%d/%m/%Y %k:%M:%S")
    end
  end
end
