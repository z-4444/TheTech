module AddProdcutsToCart
    extend ActiveSupport::Concern
  
    included do
        def add_prodcuts_to_cart(chosen_product)
            current_cart = current_user.cart
            if current_cart.products.include?(chosen_product)
                @cart_product = current_cart.cart_products.find_by(:product_id => chosen_product)
                @cart_product.quantity += 1
            else
                @cart_product = CartProduct.create(product_id: chosen_product.id,cart_id:current_cart.id)
                @cart_product.cart = current_cart
                @cart_product.product = chosen_product
            end
        end
    end
end