require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::FormattersManager::DateFormatter do
  describe "execute" do
    let(:date) { 1567683833 }
    let(:date_formatter) { instance_double("UtilsManager::FormattersManager::DateFormatter.new(#{date})") }
    let(:formatted_date) { "05/09/2019  8:43:53" }

    context "when a date is passsed" do
      it "returns a formatted date" do
        allow(date_formatter).to receive(:execute).and_return(formatted_date)
        result = date_formatter.execute()
        expect(result).to be_a(String)
        expect(result).to eql(formatted_date)
      end
    end
  end
end
