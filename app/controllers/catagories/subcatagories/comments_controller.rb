class Catagories::Subcatagories::CommentsController < ApplicationController
    def create
        @comment = Comment.create!(comment_params)
        @comment.save
        redirect_to catagories_subcatagories_product_path(@comment.product_id)
        # debugger
        
    end

    def destroy
        # debugger
        @comment = Comment.find(params[:id])
        
        @comment.destroy
        redirect_to catagories_subcatagories_product_path(@comment.product_id)
        
    end
     
    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :product_id)
    end

end
