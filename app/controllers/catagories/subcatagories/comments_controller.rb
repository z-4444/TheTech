class Catagories::Subcatagories::CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @product=@comment.product
        if @comment.save 
            respond_to do |format|
                format.js   {}
                format.json { render json: @comment, status: :created, location: @comment }
            end
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            respond_to do |format|
                format.js   { render :layout => false }
            end 
        end
        
    end
     
    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :product_id, :score )
    end

end
