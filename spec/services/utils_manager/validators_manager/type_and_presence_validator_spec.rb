require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::ValidatorsManager::TypeAndPresenceValidator do
  describe "execute" do
    let(:item) { [1, 2, 3, 4] }
    let(:invalid_item) { nil }
    let(:type) { Array }
    let(:invalid_type) { Hash }

    context "whith valids type and item" do
      it "returns true" do
        type_and_presence_validator = instance_double("UtilsManager::ValidatorsManager::TypeAndPresenceValidator.new(#{item}, #{type})")
        allow(type_and_presence_validator).to receive(:execute).and_return(true)
        result = type_and_presence_validator.execute(item, type)
        expect(result).to eql(true)
      end
    end

    context "whith invalids type and item" do
      it "returns false" do
        type_and_presence_validator = instance_double("UtilsManager::ValidatorsManager::TypeAndPresenceValidator.new(#{invalid_item}, #{invalid_type})")
        allow(type_and_presence_validator).to receive(:execute).and_return(false)
        result = type_and_presence_validator.execute(invalid_item, type)
        expect(result).to eql(false)
      end
    end
  end
end
