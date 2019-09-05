module UtilsManager::ValidatorsManager
  class CommentRelevancyValidator
    include Executable

    def initialize(comment)
      @comment = comment
    end

    def execute()
      @comment.split.size > 20
    end
  end
end
