module Utils::Validators
  class RelevantComment
    def execute(comment)
      comment.split.size > 20
    end
  end
end
