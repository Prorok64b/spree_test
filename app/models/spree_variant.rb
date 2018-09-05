class SpreeVariant < ApplicationRecord
    has_one :spree_variant

    # create record from csv row
    def create_from_csv(row)
    end
end
