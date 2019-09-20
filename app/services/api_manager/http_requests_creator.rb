module ApiManager
  class HttpRequestsCreator
    include Executable

    def initialize(verb:, url:)
      @verb = verb
      @url = url
    end

    def execute()
      begin
        RestClient.send(@verb, @url)
      rescue RestClient::ExceptionWithResponse => e
        raise(ErrorHandler::RequestError.new(message: e.response, action: @verb))
      rescue RestClient::ServerBrokeConnection
        raise(ErrorHandler::RequestError.new(message: "Server Broke Connection", action: @verb))
      rescue RestClient::SSLCertificateNotVerified
        raise(ErrorHandler::RequestError.new(message: "SSL Certificate Not Verified", action: @verb))
      end
    end
  end
end
