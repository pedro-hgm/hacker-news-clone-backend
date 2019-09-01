module Helpers
  class Validates
    def self.relevant_comment?(comment)
      return false unless comment.split.size > 20
      true
    end
  end
end
