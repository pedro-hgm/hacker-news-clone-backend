module Utils::Validators
  class ValidItens
    def execute(itens, type)
      itens.is_a?(type)
    end
  end
end
