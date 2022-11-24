class Admin::ProductsController < ApplicationController
    load_and_authorize_resource
    def index
        @products = Product.all
        authorize! :read, @products
    end

    def show
        @product=Product.find(params[:id])
    end

    def new
        @product =Product.new
    end

    def edit
        @product=Product.find(params[:id])
    end
    
    def create
        @product =Product.new(product_params)
        if @product.save
            @subcatagory=params[:product][:subcatagory_ids].reject(&:blank?)
            @subcatagory.each do |subcatagory|
                ProductsSubcatagory.create!(product_id: @product.id ,subcatagory_id: subcatagory)
            end
            
            redirect_to myproduct_path(@product)
        else
            render 'new'
        end

    end

    def update
        @product= Product.find(params[:id])
        if @product.update(product_params)
            redirect_to myproduct_path(@product)
        else
            render 'edit'
        end
        
    end
    
    def destroy
        @product=Product.find(params[:id])
        @product.destroy
        redirect_to myproducts_path 
        
    end
    
    private
    def product_params
        params.require(:product).permit(:name, :price, :user_id,{images: []} )
    end

end