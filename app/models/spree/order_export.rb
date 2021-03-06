module Spree
    class OrderExport < Spree::Order
        extend Spree::Csv
       
        def self.export_data_csv
            @export_data = Spree::OrderExport.where.not(completed_at: nil)
            @attributes = %w{completed_at number state payment_state shipment_state email total}
            export
        end
    end
end