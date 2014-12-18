module Ddr
  module Alerts
    class MessageContext < ActiveRecord::Base

      CONTEXT_DDR = 'ddr'.freeze
      CONTEXT_REPOSITORY = 'repository'.freeze
      CONTEXTS = Set.new([ CONTEXT_DDR, CONTEXT_REPOSITORY  ]).freeze

      validates :context, inclusion: { in: CONTEXTS }

      belongs_to :message, inverse_of: :contexts

    end
  end
end