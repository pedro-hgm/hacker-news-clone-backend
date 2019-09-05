require "spec_helper"
require "rails_helper"

RSpec.describe StoriesManager::StoryCreator do
  describe "execute" do
    context "when an id is passsed" do
      it "returns a story" do
        story_creator = double("StoriesManager::StoryCreator")
        id = 20884463
        item = {
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
        allow(story_creator).to receive(:execute).with(kind_of(Numeric)).and_return(item)
        story = story_creator.execute(id)
        expect(story).to be_a(Hash)
        expect(story[:id]).to eql(id)
        expect(story).to eql(item)
      end
    end
  end
end
