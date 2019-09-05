require "rails_helper"

RSpec.describe "Stories requests", type: :request do
  describe "GET /stories" do
    it "returns an array of stories ids" do
      get(stories_index_path)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      ids = JSON.parse(response.body)
      expect(ids.class).to be(Array)
      expect(ids.length).to be > 0
    end
  end

  describe "GET /story/:id" do
    context "when the id is valid" do
      it "returns a story" do
        id = 20876750
        get("/stories/show/#{id}")
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq("application/json")
        story = JSON.parse(response.body)
        expect(story.class).to be(Hash)
        expect(story["id"]).to be(id)
      end
    end

    context "when the id is invalid" do
      it "returns a not found message" do
        id = 0
        get("/stories/show/#{id}")
        expect(response).to have_http_status(404)
        expect(response.content_type).to eq("application/json")
        json = JSON.parse(response.body)
        expect(json.class).to be(Hash)
        expect(json["message"]).to match /No item could be found/
      end
    end
  end

  describe "GET /comment/:id" do
    context "when the id is valid" do
      it "returns a comment" do
        id = 20878957
        get("/stories/comment/#{id}")
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq("application/json")
        comment = JSON.parse(response.body)
        expect(comment.class).to be(Hash)
        expect(comment["id"]).to be(id)
      end
    end

    context "when the id is invalid" do
      it "returns a not found message" do
        id = 0
        get("/stories/comment/#{id}")
        expect(response).to have_http_status(404)
        expect(response.content_type).to eq("application/json")
        json = JSON.parse(response.body)
        expect(json.class).to be(Hash)
        expect(json["message"]).to match /No item could be found/
      end
    end
  end

  describe "POST /search/:query" do
    it "returns the stories ids" do
      query = "google"
      post(stories_search_path, params: { query: query })
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      ids = JSON.parse(response.body)
      expect(ids.class).to be(Array)
      expect(ids.length).to be > 0
    end
  end
  #
end
