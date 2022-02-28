module Spree
    module Export
        extend ActiveSupport::Concern
    
        def export(data, file_name)
            
            respond_to do |format|
                format.csv { send_data data, filename: "#{file_name}-#{Date.today}.csv" }
            end
        end
    end
end