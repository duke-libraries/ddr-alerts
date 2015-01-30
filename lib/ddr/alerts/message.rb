module Ddr
  module Alerts
    class Message < ActiveRecord::Base

      scope :active, -> { where(active: true) }

      def to_s
        actv = active ? 'ACTIVE' : 'INACTIVE'
        "[#{id}] [#{actv}] [\"#{message}\"]"
      end
    end
  end
end