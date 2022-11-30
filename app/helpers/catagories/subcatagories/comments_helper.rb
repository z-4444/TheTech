module Catagories::Subcatagories::CommentsHelper
    
    def create_update
        if @comment.id != nil
            return "/catagories/subcatagories/comments/#{@comment.id}"
        else
            return catagories_subcatagories_comments_path
        end

    end
    def method
        if @comment.id != nil
            return :patch
        else
            return :post
        end

    end
end
