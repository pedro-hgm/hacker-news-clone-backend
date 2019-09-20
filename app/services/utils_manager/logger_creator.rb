module UtilsManager
  class LoggerCreator
    attr_reader :logger

    MEGABYTE = 1024 ** 2
    ONE_HUNDRED_MEGABYTES = MEGABYTE * 100

    def initialize(file:, size: 1, limit: ONE_HUNDRED_MEGABYTES)
      @logger = Logger.new(file, size, limit)
    end
  end
end
