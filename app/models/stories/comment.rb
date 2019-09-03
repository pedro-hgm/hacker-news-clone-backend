module Stories
  class Comment < Story
    def initialize
      super
      @comment_formatter = Utils::Formatters::CommentFormatter.new
    end

    def show(id)
      comment = @main_api.get_item(id)
      comment ? @comment_formatter.execute(comment) : false
    end
  end
end
