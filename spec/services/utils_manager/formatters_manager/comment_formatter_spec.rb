require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::FormattersManager::CommentFormatter do
  describe "execute" do
    context "when a comment is passsed" do
      it "returns a formatted comment" do
        comment_formatter = UtilsManager::FormattersManager::CommentFormatter
        comment = { "by" => "Shish2k", "id" => 20885700, "kids" => [20885915], "parent" => 20883860, "text" => "&quot;Is performance still an issue in this era of cheap 486 computers and super-fast Pentium computers? You bet. How many programs that you use really run so fast that you wouldn&#x27;t be happier if they ran faster? We&#x27;re so used to slow software that when a compile-and-link sequence that took two minutes on a PC takes just ten seconds on a 486 computer, we&#x27;re ecstatic—when in truth we should be settling for nothing less than instantaneous response.&quot;<p>Not sure if I want to laugh or cry at how 100% relevant this still is 20 years later...", "time" => 1567683833, "type" => "comment" }

        formatted_comment = {
          id: 20885700,
          author: "Shish2k",
          text: "&quot;Is performance still an issue in this era of cheap 486 computers and super-fast Pentium computers? You bet. How many programs that you use really run so fast that you wouldn&#x27;t be happier if they ran faster? We&#x27;re so used to slow software that when a compile-and-link sequence that took two minutes on a PC takes just ten seconds on a 486 computer, we&#x27;re ecstatic—when in truth we should be settling for nothing less than instantaneous response.&quot;<p>Not sure if I want to laugh or cry at how 100% relevant this still is 20 years later...",
          date: "05/09/2019  8:43:53",
          nested: [
            20885915,
          ],
        }

        result = comment_formatter.execute(comment)
        expect(result).to be_a(Hash)
        expect(result).to eql(formatted_comment)
      end
    end
  end
end
