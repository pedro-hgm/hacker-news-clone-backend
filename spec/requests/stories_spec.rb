require "rails_helper"

RSpec.describe "Stories", type: :request do
  describe "GET /stories" do
    it "works! (now write some real specs)" do
      get stories_index_path
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
