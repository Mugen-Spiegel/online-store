module Spree
    class UserExport < Spree::User
        extend Spree::Csv
        

        def self.export_data_csv

            @export_data = joins(:orders, role_users: :role)
            .select('spree_users.id, spree_users.email, spree_roles.name, COUNT(spree_orders.number) as orders, SUM(spree_orders.total) as total')
            .group('spree_users.id')
            .group('spree_roles.name')
            @attributes = %w{email name orders total}

            export
        end
    end
end