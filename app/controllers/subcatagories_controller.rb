class SubcatagoriesController < ApplicationController
    def index
        if params.has_key?(:catagory)
            @catagory=Catagory.find(params[:catagory])
            @subcatagories=@catagory.subcatagories
            respond_to do |format|
                format.js { render :layout => false }
            end
        else
            @subcatagories = Subcatagory.all
        end
        
    end
    def show
        @subcatagory=Subcatagory.find(params[:id])
    end

    def new
        @subcatagory =Subcatagory.new
    end

    def edit
        @subcatagory=Subcatagory.find(params[:id])
    end
  
    def create
        @subcatagory =Subcatagory.new(subcatagory_params)
        if @subcatagory.save
            redirect_to subcatagory_path(@subcatagory)
        else
            render 'new'
        end

    end

    def update
        @subcatagory= Subcatagory.find(params[:id])
        if @subcatagory.update(subcatagory_params)
            redirect_to subcatagory_path(@subcatagory)
        else
            render 'edit'
        end
       
    end
    def destroy
        @subcatagory=Subcatagory.find(params[:id])
        @subcatagory.destroy
        redirect_to subcatagories_path 
        
    end
    
    private
    def subcatagory_params
        params.require(:subcatagory).permit(:name,:user_id,:catagory_id)
    end
end
