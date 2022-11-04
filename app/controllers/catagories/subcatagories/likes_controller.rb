class Catagories::Subcatagories::LikesController < ApplicationController
    def create
        # debugger
        @like=Like.create(like_params)
        @like.save

        if already_liked?
            @like = Like.find(params[:id])
            @like.destroy
        else
            @product.likes.create(like_params)
        end
        redirect_to catagories_subcatagories_product_path(@like.product_id)
        
    end

    # def destroy
    #     if !(already_liked)?
    #         flash[:notice]="already liked"
    #     else
    #         @product=Product.find_by(params[:id])
    #         @like=@product.likes.find(:id)
    #         @like.destroy
            
    #     end
    #     redirect_to catagories_subcatagories_product_path
        
    # end

    private
    def like_params
        params.permit(:user_id, :product_id)
    end

    def already_liked?
        Like.where(user_id: current_user.id,product_id: params[:product_id]).exists?
    end
end
