module ConcernHelper
    extend ActiveSupport::Concern
  
    included do
        def find_order
            if current_user.seller?
                @product = current_user.products
                @orders = Order.seller_products

            else
                @orders=Order.all
            end
            
        end

        def find_admin_seller_product
            if current_user.seller?
                @products = current_user.products
            else
                @products = Product.all
            end
            
        end
    end
end