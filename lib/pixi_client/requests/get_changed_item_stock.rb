module PixiClient
  module Requests
    class GetChangedItemStock < PixiClient::SoapRequest

      attr_accessor :since, :row_count

      FIVE_MINUTES = 5 * 60

      def initialize(opts)
        self.since = opts[:since] || (Time.now - FIVE_MINUTES)
        self.row_count = opts[:row_count]
      end

      def api_method
        :pixi_get_changed_item_stock
      end

      def message
        { 'Since' => since.strftime(TIME_STRING_FORMAT) }.tap do |opts|
          opts['RowCount'] = row_count unless row_count.nil?
        end
      end
    end
  end
end