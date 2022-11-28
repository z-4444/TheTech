class Catagories::Subcatagories::ProductsController < ApplicationController
    # skip_before_action :authenticate_user!, only: [:index,:show]
    load_and_authorize_resource
    include FindProduct

    def index
        find_product
    end

    def show
        @product=Product.find(params[:id])
        @comment=Comment.new
    end

    private
    def product_params
        params.require(:product).permit(:name, :price, :user_id,:subcatagory_id)
    end

end
