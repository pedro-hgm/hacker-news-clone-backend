require "spec_helper"
require "rails_helper"

RSpec.describe ApiManager::FetchLatestStoriesIds do
  describe "execute" do
    let(:query) { "Human" }
    let(:story) {
      {
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
    }

    context "with a query" do
      it "returns an array of latest stories ids" do
        api_fetch_latest_stories = instance_double("ApiManager::FetchLatestStoriesIds.new(#{query})")
        allow(api_fetch_latest_stories).to receive(:execute).and_return(story)
        response = api_fetch_latest_stories.execute()
        expect(response).to be_a(Hash)
        expect(response[:title]).to match query
      end
    end

    context "withour a query" do
      it "raises an ArgumentError" do
        api_fetch_latest_stories = instance_double("ApiManager::FetchLatestStoriesIds")
        allow(api_fetch_latest_stories).to receive(:execute).and_raise(ArgumentError)
        expect { api_fetch_latest_stories.execute() }.to raise_error(ArgumentError)
      end
    end
  end
end
