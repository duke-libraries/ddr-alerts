require 'spec_helper'

module Ddr
  module Alerts

    RSpec.describe Message, type: :model do

      context "scopes" do
        context "active" do
          let(:active_msg) { FactoryGirl.create(:message, :active) }
          let(:inactive_msg) { FactoryGirl.create(:message, :inactive) }
          it "should return the correct entries" do
            expect(Message.active).to include(active_msg)
            expect(Message.active).to_not include(inactive_msg)
          end
        end
        context "contexts" do
          let(:ddr_msg) { FactoryGirl.create(:message, :ddr) }
          let(:repository_msg) { FactoryGirl.create(:message, :repository) }
          it "should return the correct entries" do
            expect(Message.ddr).to include(ddr_msg)
            expect(Message.ddr).to_not include(repository_msg)
            expect(Message.repository).to include(repository_msg)
            expect(Message.repository).to_not include(ddr_msg)
          end
        end
      end
    end

  end
end