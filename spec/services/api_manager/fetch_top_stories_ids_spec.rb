require "spec_helper"
require "rails_helper"

RSpec.describe ApiManager::FetchTopStoriesIds do
  describe "execute" do
    it "returns an array of top stories ids" do
      api_fetch_stories = instance_double("ApiManager::FetchTopStoriesIds")
      allow(api_fetch_stories).to receive(:execute) { [1, 2, 3, 4, 5] }
      ids = api_fetch_stories.execute()
      expect(ids).to be_a(Array)
      expect(ids.length).to be > 0
    end
  end
end
