module Ddr
  module Alerts
    class MessageContext < ActiveRecord::Base

      CONTEXT_REPOSITORY = 'repository'.freeze
      CONTEXT_DDR = 'ddr'.freeze
      CONTEXTS = [ CONTEXT_REPOSITORY, CONTEXT_DDR ].freeze

      validates :context, inclusion: { in: CONTEXTS }

      belongs_to :message, inverse_of: :contexts

    end
  end
end