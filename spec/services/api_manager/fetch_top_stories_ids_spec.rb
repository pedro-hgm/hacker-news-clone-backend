require "spec_helper"
require "rails_helper"

RSpec.describe ApiManager::FetchTopStoriesIds do
  describe "execute" do
    let(:ids) { [1, 2, 3, 4, 5] }
    it "returns an array of top stories ids" do
      api_fetch_stories = instance_double("ApiManager::FetchTopStoriesIds")
      allow(api_fetch_stories).to receive(:execute).and_return(ids)
      response = api_fetch_stories.execute()
      expect(response).to be_a(Array)
      expect(response.length).to be > 0
    end
  end
end
