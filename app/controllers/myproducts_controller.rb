class MyproductsController < ApplicationController
    def index
        respond_to do |format|
            format.html
            format.json { render json: MyproductDatatable.new(params) }
        end
    end
    def show
        @product=Product.find(params[:id])
    end
end
