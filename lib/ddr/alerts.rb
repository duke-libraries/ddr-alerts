require "ddr/alerts/engine"
require "ddr/alerts/version"

require "active_record"

module Ddr
  module Alerts
    extend ActiveSupport::Autoload

    autoload :Message
    autoload :MessageContext

    def self.table_name_prefix
      'ddr_alerts_'
    end

  end
end
