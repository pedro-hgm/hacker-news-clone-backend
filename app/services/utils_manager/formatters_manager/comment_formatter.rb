module UtilsManager::FormattersManager
  class CommentFormatter
    include Executable

    def initialize(comment)
      @comment = comment
      @comment_validator = UtilsManager::ValidatorsManager::CommentRelevancyValidator
      @date_formatter = UtilsManager::FormattersManager::DateFormatter
    end

    def execute()
      return unless @comment["text"] && @comment_validator.execute(@comment["text"])
      {
        id: @comment["id"],
        author: @comment["by"] || "No author provided",
        text: @comment["text"] || "This comment has no text",
        date: @date_formatter.execute(@comment["time"]) || "No time provided",
        nested: false || @comment["kids"],
      }
    end
  end
end
