require "spec_helper"
require "rails_helper"

RSpec.describe ApiManager::FetchLatestStoriesIds do
  describe "execute" do
    it "returns an array of latest stories ids" do
      api_fetch_latest_stories = double("ApiManager::FetchLatestStoriesIds")
      query = "Human"
      story = {
        "by": "headalgorithm",
        "descendants": 1,
        "id": 20880789,
        "kids": [
          20882938,
        ],
        "score": 287,
        "time": 1567626854,
        "title": "Human speech may have a universal transmission rate: 39 bits per second",
        "type": "story",
        "url": "https://www.sciencemag.org/news/2019/09/human-speech-may-have-universal-transmission-rate-39-bits-second",
      }
      allow(api_fetch_latest_stories).to receive(:execute).with(kind_of(String)).and_return(story)
      response = api_fetch_latest_stories.execute(query)
      expect(response).to be_a(Hash)
      expect(response[:title]).to match query
    end
  end
end
