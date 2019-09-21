require "spec_helper"
require "rails_helper"

RSpec.describe ApiManager::FetchItem do
  describe "execute" do
    let(:id) { 20870514 }
    let(:item) {
      {
        "by": "jayzee",
        "id": 20870514,
        "score": 1,
        "time": 1567540549,
        "title": "Quartzy (YC S11) is hiring a Sr SRE – remote and first of platform team",
        "type": "job",
        "url": "https://jobs.lever.co/quartzy/eda5b92c-4e21-47c8-8f62-84cae806cee7?lever-origin=applied&lever-source%5B%5D=Hacker%20News",
      }
    }

    context "when an id is passsed" do
      it "returns an item" do
        api_fetch_item = instance_double("ApiManager::FetchItem.new(id: #{id})")
        allow(api_fetch_item).to receive(:execute).and_return(item)
        response = api_fetch_item.execute()
        expect(response).to be_a(Hash)
        expect(response).to eql(item)
        expect(response[:id]).to eql(id)
      end
    end

    context "when an id is not passsed" do
      it "raises an ArgumentError" do
        api_fetch_item = instance_double("ApiManager::FetchItem")
        allow(api_fetch_item).to receive(:execute).and_raise(ArgumentError)
        expect { api_fetch_item.execute() }.to raise_error(ArgumentError)
      end
    end
  end
end
