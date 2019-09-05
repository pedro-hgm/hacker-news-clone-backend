module UtilsManager::FormattersManager
  class DateFormatter
    include Executable

    def initialize(date)
      @date = date
    end

    def execute()
      Time.at(@date).strftime("%d/%m/%Y %k:%M:%S")
    end
  end
end
