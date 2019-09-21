require "spec_helper"
require "rails_helper"

RSpec.describe StoriesManager::CommentCreator do
  describe "execute" do
    let(:id) { 20782415 }
    let(:item) {
      {
        "by": "nostromo",
        "id": 20782415,
        "kids": [
          20784108,
          20784985,
          20782581,
          20782479,
        ],
        "parent": 20779097,
        "text": "Bigger than eBay by market cap, but much smaller by revenue.",
        "time": 1566593386,
        "type": "comment",
      }
    }
    let(:comment_creator) { instance_double("StoriesManager::CommentCreator.new(id: #{id})") }

    context "when an id is passsed" do
      it "returns a comment" do
        allow(comment_creator).to receive(:execute).and_return(item)
        comment = comment_creator.execute()
        expect(comment).to be_a(Hash)
        expect(comment[:id]).to eql(id)
        expect(comment).to eql(item)
      end
    end

    context "when a comment couldn't be created" do
      it "returns false" do
        allow(comment_creator).to receive(:execute).and_return(false)
        expect(comment_creator.execute()).to be(false)
      end
    end
  end
end
