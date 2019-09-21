require "spec_helper"
require "rails_helper"

RSpec.describe StoriesManager::StoryCreator do
  describe "execute" do
    let(:id) { 20884463 }
    let(:item) {
      {
        "by": "federicoponzi",
        "descendants": 18,
        "id": 20884463,
        "kids": [
          20885453,
          20885243,
        ],
        "score": 74,
        "time": 1567666595,
        "title": "Secushare: A decentralized, secure social network built on GNUnet",
        "type": "story",
        "url": "https://secushare.org/",
      }
    }
    let(:story_creator) { instance_double("StoriesManager::StoryCreator.new(id: #{id})") }
    context "when an id is passsed" do
      it "returns a story" do
        allow(story_creator).to receive(:execute).and_return(item)
        story = story_creator.execute()
        expect(story).to be_a(Hash)
        expect(story[:id]).to eql(id)
        expect(story).to eql(item)
      end
    end

    context "when a story couldn't be created" do
      it "returns false" do
        allow(story_creator).to receive(:execute).and_return(false)
        expect(story_creator.execute()).to be(false)
      end
    end
  end
end
