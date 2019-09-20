module StoriesManager
  class StoryCreator
    include Executable

    def initialize(id:)
      @id = id
      @story_formatter = UtilsManager::FormattersManager::StoryFormatter
    end

    def execute()
      story = ApiManager::FetchItem.execute(id: @id)
      story ? @story_formatter.execute(story) : false
    end
  end
end
