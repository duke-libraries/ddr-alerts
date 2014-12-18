module Ddr
  module Alerts
    class Message < ActiveRecord::Base

      has_many :contexts, class_name: "Ddr::Alerts::MessageContext", inverse_of: :message, dependent: :destroy

      scope :active, -> { where(active: true) }

      scope :ddr, -> { joins(:contexts).where(ddr_alerts_message_contexts: { context: Ddr::Alerts::MessageContext::CONTEXT_DDR }) }
      scope :repository, -> { joins(:contexts).where(ddr_alerts_message_contexts: { context: Ddr::Alerts::MessageContext::CONTEXT_REPOSITORY }) }

      def to_s
        actv = active ? 'ACTIVE' : 'INACTIVE'
        ctxs = contexts.map { |context| context.context }
        "[#{id}] [#{ctxs.join(';')}] [#{actv}] [\"#{message}\"]"
      end
    end
  end
end