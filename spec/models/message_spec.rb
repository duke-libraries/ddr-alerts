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
      end
    end

  end
end