module Spree
  module Api
    class ExportsController < Spree::Api::BaseController
      include Spree::Export
      
      def order
        export(Spree::OrderExport.export_data_csv, 'order')
      end

      def users
        export(Spree::UserExport.export_data_csv, 'users')
      end
    end
  end
end
