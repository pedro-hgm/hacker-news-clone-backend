require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::FormattersManager::IdFormatter do
  describe "execute" do
    let(:objects) {
      [{
        "created_at" => "2019-09-05T13:38:12.000Z",
        "title" => "Google Wants to Help Tech Companies Know Less About You",
        "url" => "https://www.wired.com/story/google-differential-privacy-open-source/",
        "author" => "dsr12", "points" => 1, "story_text" => nil, "comment_text" => nil,
        "num_comments" => 0,
        "story_id" => nil,
        "story_title" => nil,
        "story_url" => nil,
        "parent_id" => nil,
        "created_at_i" => 1567690692,
        "relevancy_score" => 9043,
        "_tags" => ["story", "author_dsr12", "story_20886524"],
        "objectID" => "20886524",
      },
       { "created_at" => "2019-09-05T12:41:25.000Z",
         "title" => "Ask HN: How to build web apps that deploy user environments?",
         "url" => nil,
         "author" => "dizzydiz",
         "points" => 2,
         "story_text" => "Think apps along the lines of web flow, squarespace etc. Whereby when a new user joins they have an environment to develop in and direct a custom URL to if needed.<p>I&#x27;m agnostic about whether they&#x27;for example.",
         "comment_text" => nil,
         "num_comments" => 1,
         "story_id" => nil,
         "story_title" => nil,
         "story_url" => nil,
         "parent_id" => nil,
         "created_at_i" => 1567687285,
         "relevancy_score" => 9043,
         "_tags" => ["story", "author_dizzydiz", "story_20886036", "ask_hn"],
         "objectID" => "20886036" }]
    }
    let(:id_formatter) { instance_double("UtilsManager::FormattersManager::IdFormatter.new(#{objects})") }
    let(:ids) { ["20886524", "20886036"] }

    context "when an array of objects is passsed" do
      it "returns the ids of those objects" do
        allow(id_formatter).to receive(:execute).and_return(ids)
        result = id_formatter.execute()
        expect(result).to be_a(Array)
        expect(result).to eql(ids)
      end
    end
  end
end
