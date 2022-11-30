class Order < ApplicationRecord
    has_many :orderproducts, dependent: :destroy
    has_many :products, through: :orderproducts
    belongs_to :user
    
    def sub_total
        @order_product = Orderproduct.joins(:product).where(order_id: self.id)
        return @order_product.map(&:total_price).reduce(:+)
    end
    
    scope :seller_products, -> {joins(:orderproducts).where(:orderproducts => {:product_id => @product.ids})}

end
