require "spec_helper"
require "rails_helper"

RSpec.describe ApiManager::UriManager::SecondApiUri do
  describe "execute" do
    it "returns the uri" do
      uri = ApiManager::UriManager::SecondApiUri.execute()
      expect(uri).to be_a(String)
      expect(uri.length).to be > 0
    end
  end
end