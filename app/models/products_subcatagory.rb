class ProductsSubcatagory < ApplicationRecord
    belongs_to :product
    belongs_to :subcatagory
end
