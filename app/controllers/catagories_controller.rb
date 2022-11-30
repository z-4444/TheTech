class CatagoriesController < ApplicationController
    load_and_authorize_resource
    
    def index
        @catagories=Catagory.all
    end
    def show
        @catagory = Catagory.find(params[:id])
    end

    def new
        @catagory = Catagory.new
    end

    def edit
        @catagory = Catagory.find(params[:id])
    end

    def create
        @catagory = Catagory.new(catagory_params)
        if @catagory.save
            redirect_to catagory_path(@catagory)
        else
            render 'new'
        end

    end

    def update
        @catagory= Catagory.find(params[:id])
        if @catagory.update(Catagory_params)
            redirect_to catagory_path(@catagory)
        else
            render 'edit'
        end
    
    end
    def destroy
        @catagory=Catagory.find(params[:id])
        @catagory.destroy
        redirect_to catagories_path 
        
    end

    private
    def catagory_params
        params.require(:catagory).permit(:name,:user_id)
    end
end
