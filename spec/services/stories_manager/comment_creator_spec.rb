require "spec_helper"
require "rails_helper"

RSpec.describe StoriesManager::CommentCreator do
  describe "execute" do
    context "when an id is passsed" do
      it "returns a comment" do
        comment_creator = double("StoriesManager::CommentCreator")
        id = 20782415
        item = {
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
        allow(comment_creator).to receive(:execute).with(kind_of(Numeric)).and_return(item)
        comment = comment_creator.execute(id)
        expect(comment).to be_a(Hash)
        expect(comment[:id]).to eql(id)
        expect(comment).to eql(item)
      end
    end
  end
end
