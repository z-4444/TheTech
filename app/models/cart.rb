class Cart < ApplicationRecord
    has_many :cart_products, dependent: :destroy
    has_many :products, through: :cart_products
    belongs_to :user

    def sub_total
      @cart_product = CartProduct.joins(:product).where(cart_id: self.id)
      return @cart_product.map(&:total_price).reduce(:+)
    end
end
