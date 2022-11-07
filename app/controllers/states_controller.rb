class StatesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    def index
        @country=Country.find(params[:country])
        # debugger
        @states=@country.states
        respond_to do |format|
            format.js { render :layout => false }
        end
    end
end
