module UtilsManager::FormattersManager
  class IdFormatter
    include Executable

    def initialize(objects)
      @objects = objects
    end

    def execute()
      @objects.map { |object| object["objectID"] }
    end
  end
end
