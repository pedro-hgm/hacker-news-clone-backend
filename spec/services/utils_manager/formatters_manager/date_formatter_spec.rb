require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::FormattersManager::DateFormatter do
  describe "execute" do
    context "when a date is passsed" do
      it "returns a formatted date" do
        date_formatter = UtilsManager::FormattersManager::DateFormatter
        date = 1567683833
        formatted_date = "05/09/2019  8:43:53"
        result = date_formatter.execute(date)
        expect(result).to be_a(String)
        expect(result).to eql(formatted_date)
      end
    end
  end
end
