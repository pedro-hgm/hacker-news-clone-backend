require "spec_helper"
require "rails_helper"

RSpec.describe ApiManager::HttpRequestsCreator do
  describe "execute" do
    let(:verb) { :get }
    let(:url) { "http://example.com/" }
    let(:response) {
      {
        status: 200,
        message: :ok,
        body: "<h1>Hello World</h1>",
      }
    }
    let(:request_error) { ErrorHandler::RequestError.new(message: "not found", action: verb) }

    context "with the correct parameters" do
      it "makes http requests" do
        http = instance_double("ApiManager::HttpRequestsCreator.new(#{verb}, #{url})")
        allow(http).to receive(:execute).and_return(response)
        result = http.execute()
        expect(result).to be_a(Hash)
        expect(result[:status]).to eql(response[:status])
        expect(result[:message]).to eql(response[:message])
        expect(result[:body]).to match(response[:body])
      end
    end

    context "with a bad request" do
      it "raises an ErrorHandler::RequestError" do
        http = instance_double("ApiManager::HttpRequestsCreator.new(#{verb}, #{url})")
        allow(http).to receive(:execute).and_raise(request_error)
        expect { http.execute() }.to raise_error(request_error)
        begin
          http.execute()
        rescue ErrorHandler::RequestError => e
          expect(e.message).to eql("not found")
          expect(e.action).to eql(verb)
        end
      end
    end
  end
end
