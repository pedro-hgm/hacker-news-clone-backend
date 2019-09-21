require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::FormattersManager::CommentFormatter do
  describe "execute" do
    let(:comment_formatter) { instance_double("UtilsManager::FormattersManager::CommentFormatter.new(#{comment})") }
    let(:comment) {
      {
        "by" => "Shish2k",
        "id" => 20885700,
        "kids" => [20885915],
        "parent" => 20883860,
        "text" => "&quot;Is performance still an issue in this era of cheap 486 computers and super-fast Pentium computers? You bet. How many programs that you use really run so fast that you wouldn&#x27;t be happier if they ran faster still is 20 years later...",
        "time" => 1567683833,
        "type" => "comment",
      }
    }
    let(:formatted_comment) {
      {
        id: 20885700,
        author: "Shish2k",
        text: "&quot;Is performance still an issue in this era of cheap 486 computers and super-fast Pentium computers? You bet. How many programs that you use really run so fast that you wouldn&#x27;t be happier if they ran faster still is 20 years later...",
        date: "05/09/2019  8:43:53",
        nested: [
          20885915,
        ],
      }
    }
    context "when a comment is passsed" do
      it "returns a formatted comment" do
        allow(comment_formatter).to receive(:execute).and_return(formatted_comment)
        result = comment_formatter.execute()
        expect(result).to be_a(Hash)
        expect(result).to eql(formatted_comment)
      end
    end
  end
end
