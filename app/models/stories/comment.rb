module Stories
  class Comment < Story
    def initialize
      super
    end

    def show(id)
      comment = @main_api.get_item(id)
      comment ? @formatter.comment(comment) : false
    end
  end
end
