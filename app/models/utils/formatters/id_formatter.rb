module Utils::Formatters
  class IdFormatter
    def execute(object)
      object.map { |object| object["objectID"] }
    end
  end
end
