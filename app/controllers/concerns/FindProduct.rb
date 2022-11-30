module FindProduct
    extend ActiveSupport::Concern
  
    included do
        def find_product
            if params.has_key?(:subcatagory)
                @subcatagory=Subcatagory.find(params[:subcatagory])
                @products=@subcatagory.products
            elsif params.has_key?(:q)
                query = params[:q]
                @products=Product.search(query)
            else
                @products=Product.all
            end
            
        end
    end
end