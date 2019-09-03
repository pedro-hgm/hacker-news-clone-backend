module Utils
  class Validator
    def relevant_comment?(comment)
      comment.split.size > 20 ? true : false
    end

    def valid_itens?(itens, type)
      itens.is_a?(type) ? true : false
    end
  end
end
