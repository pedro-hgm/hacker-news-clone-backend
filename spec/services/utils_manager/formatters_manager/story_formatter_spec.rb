require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::FormattersManager::StoryFormatter do
  describe "execute" do
    context "when a story is passsed" do
      it "returns a formatted story" do
        story_formatter = UtilsManager::FormattersManager::StoryFormatter
        story = { "by" => "doppp", "descendants" => 2, "id" => 20886538, "kids" => [20886620, 20886621], "score" => 14, "time" => 1567690795, "title" => "Slack’s Shares Plunge After It Predicts a Larger Loss", "type" => "story", "url" => "https://www.nytimes.com/2019/09/04/technology/slack-earnings.html" }

        formatted_story = {
          id: 20886538,
          title: "Slack’s Shares Plunge After It Predicts a Larger Loss",
          url: "https://www.nytimes.com/2019/09/04/technology/slack-earnings.html",
          author: "doppp",
          date: "05/09/2019 10:39:55",
          comments: [20886620, 20886621],
          comments_count: 2,
        }

        result = story_formatter.execute(story)
        expect(result).to be_a(Hash)
        expect(result).to eql(formatted_story)
      end
    end
  end
end
