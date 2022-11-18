class Orderproduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    def total_price
        self.quantity.to_i * self.product.price
    end
end
