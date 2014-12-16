module Ddr
  module Alerts
    class Message < ActiveRecord::Base

      has_many :contexts, class_name: "Ddr::Alerts::MessageContext", inverse_of: :message, dependent: :destroy

      scope :active, -> { where(active: true) }

      scope :ddr, -> { joins(:contexts).where(ddr_alerts_message_contexts: { context: Ddr::Alerts::MessageContext::CONTEXT_DDR }) }
      scope :repository, -> { joins(:contexts).where(ddr_alerts_message_contexts: { context: Ddr::Alerts::MessageContext::CONTEXT_REPOSITORY }) }

    end
  end
end