class Catagories::Subcatagories::ProductsController < ApplicationController
    def index
        # debugger <% @subcatagory.products.each do |product| %>
        if params.has_key?(:subcatagory)
            @subcatagory=Subcatagory.find(params[:subcatagory])
            # debugger
            @products=@subcatagory.products
        else
            @products = Product.all
        end
        
    end

    def show
        @product=Product.find(params[:id])
        @comment=Comment.new
    end

    # def new
    #     @product =Product.new
    # end

    # def edit
    #     @product=Product.find(params[:id])
    # end
    
    # def create
    #     @product =Product.new(product_params)
    #     if @product.save
    #         redirect_to users_product_path(@product)
    #     else
    #         render 'new'
    #     end

    # end

    # def update
    #     @product= Product.find(params[:id])
    #     if @product.update(product_params)
    #         redirect_to users_product_path(@product)
    #     else
    #         render 'edit'
    #     end
        
    # end
    
    # def destroy
    #     @product=Product.find(params[:id])
    #     @product.destroy
    #     redirect_to users_products_path 
        
    # end
    
    private
    def product_params
        params.require(:product).permit(:name, :price, :user_id,:subcatagory_id)
    end

end
