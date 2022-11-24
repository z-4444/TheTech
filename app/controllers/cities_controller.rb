class CitiesController < ApplicationController
    # skip_before_action :authenticate_user!, only: [:index]
    def index
        @state=State.find(params[:state])
        @cities=@state.cities
        respond_to do |format|
            format.js { render :layout => false }
        end
    end
end
