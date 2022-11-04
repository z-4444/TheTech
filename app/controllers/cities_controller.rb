class CitiesController < ApplicationController
    def index
        @state=State.find(params[:state])
        @cities=@state.cities
        respond_to do |format|
            format.js { render :layout => false }
        end
    end
end
