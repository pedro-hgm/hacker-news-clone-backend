module UtilsManager::ValidatorsManager
  class TypeAndPresenceValidator
    include Executable

    def initialize(item, type)
      @item = item
      @type = type
    end

    def execute()
      return false unless @item.is_a?(@type) && @item.length > 0
      true
    end
  end
end
