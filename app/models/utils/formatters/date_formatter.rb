module Utils::Formatters
  class DateFormatter
    def execute(date)
      Time.at(date).strftime("%d/%m/%Y %k:%M:%S")
    end
  end
end
