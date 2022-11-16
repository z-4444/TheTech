class CartProductsController < ApplicationController
    include AddProdcutsToCart

    def create
        chosen_product = Product.find(params[:product_id])
        add_prodcuts_to_cart(chosen_product)
        if @cart_product.save
            respond_to do |format|
                format.js { render :layout => false }
            end
        end  
        
    end

    def destroy
        @cart_product = CartProduct.find(params[:id])
        if @cart_product.destroy
            respond_to do |format|
                format.js { render :layout => false }
            end
        end 
    end

    def add_quantity
        @cart_product = CartProduct.find(params[:id])
        @cart_product.quantity += 1
        if @cart_product.save
            respond_to do |format|
                format.js { render :layout => false }
            end
        end
    end

    def reduce_quantity
        @cart_product = CartProduct.find(params[:id])
        @cart_product.quantity -= 1            
        if @cart_product.save
            respond_to do |format|
                format.js { render :layout => false }
            end
        end
    end

end
