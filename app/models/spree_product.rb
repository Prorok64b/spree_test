class SpreeProduct < ApplicationRecord
    belogs_to :spree_variant

    # create record from csv row
    def create_from_csv(row)
        create(
            name:        row[:name],
            description: row[:description],
            description: row[:description],
        )
    end
end
