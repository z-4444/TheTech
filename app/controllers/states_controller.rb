class StatesController < ApplicationController
    def index
        # debugger
        @country=Country.find(params[:country])
        @states=@country.states
        respond_to do |format|
            format.js { render :layout => false }
        end
    end
end
