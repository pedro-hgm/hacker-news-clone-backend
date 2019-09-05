module StoriesManager
  class CommentCreator
    include Executable

    def initialize(id)
      @id = id
      @comment_formatter = UtilsManager::FormattersManager::CommentFormatter
    end

    def execute()
      comment = ApiManager::FetchItem.execute(@id)
      comment ? @comment_formatter.execute(comment) : false
    end
  end
end
