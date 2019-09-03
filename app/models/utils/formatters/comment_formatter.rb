module Utils::Formatters
  class CommentFormatter
    def initialize
      @valid_comment = Utils::Validators::RelevantComment.new
      @date_formatter = Utils::Formatters::DateFormatter.new
    end

    def execute(comment)
      return unless comment["text"] && @valid_comment.execute(comment["text"])
      {
        id: comment["id"],
        author: comment["by"] || "No author provided",
        text: comment["text"] || "This comment has no text",
        date: @date_formatter.execute(comment["time"]) || "No time provided",
        nested: false || comment["kids"],
      }
    end
  end
end
