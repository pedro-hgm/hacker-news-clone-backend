require "spec_helper"
require "rails_helper"

RSpec.describe UtilsManager::ValidatorsManager::CommentRelevancyValidator do
  describe "execute" do
    let(:relevant_comment) { "Leaving aside the costs of their listing and related compensation (which are crazy high!) they made a $57m loss on $145m in revenue.<p>Considering that they are a pure software company this is quite shockingand, to me, a sign not to touch them with a barge pole." }
    let(:not_relevant_comment) { "Leaving aside the costs of their listing and related compensation..." }

    context "when the comment is relevant" do
      it "returns true" do
        comment_relevancy_validator = instance_double("UtilsManager::ValidatorsManager::CommentRelevancyValidator.new(#{relevant_comment})")
        allow(comment_relevancy_validator).to receive(:execute).and_return(true)
        result = comment_relevancy_validator.execute()
        expect(result).to eql(true)
      end
    end

    context "when the comment isn't relevant" do
      it "returns false" do
        comment_relevancy_validator = instance_double("UtilsManager::ValidatorsManager::CommentRelevancyValidator.new(#{not_relevant_comment})")
        allow(comment_relevancy_validator).to receive(:execute).and_return(false)
        result = comment_relevancy_validator.execute()
        expect(result).to eql(false)
      end
    end
  end
end
