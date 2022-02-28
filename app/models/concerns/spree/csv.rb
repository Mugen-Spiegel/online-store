module Spree
    module Csv
        extend ActiveSupport::Concern
    
        def export
            CSV.generate(headers: true) do |csv|
                csv << @attributes
                @export_data.each do |data|
                    csv << @attributes.map{ |attr| data[attr] }
                end
            end
        end
    end
end