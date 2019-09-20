class RequestError < StandardError
  attr_reader :action

  def initialize(message:, action:)
    super(message)
    @action = action
  end
end

# raise PermissionDeniedError.new("Permission Denied", :delete)
