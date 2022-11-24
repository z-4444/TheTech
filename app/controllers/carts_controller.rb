class CartsController < ApplicationController
    load_and_authorize_resource
    def show
        @cart=current_user.cart    
    end

end
