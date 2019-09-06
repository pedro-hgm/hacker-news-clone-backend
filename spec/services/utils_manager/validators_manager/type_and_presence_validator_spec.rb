require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::ValidatorsManager::TypeAndPresenceValidator do
  describe "execute" do
    context "whith valids type and item" do
      it "returns true" do
        type_and_presence_validator = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
        item = [1, 2, 3, 4]
        type = Array

        result = type_and_presence_validator.execute(item, type)
        expect(result).to eql(true)
      end
    end

    context "whith invalids type and item" do
      it "returns false" do
        type_and_presence_validator = UtilsManager::ValidatorsManager::TypeAndPresenceValidator
        invalid_item = nil
        type = Hash
        result = type_and_presence_validator.execute(invalid_item, type)
        expect(result).to eql(false)
      end
    end
  end
end
