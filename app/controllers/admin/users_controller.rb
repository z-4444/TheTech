class Admin::UsersController < ApplicationController
    def index
        @users=User.all
    end
    def new
        @user =User.new
    end
    def edit
        @user=User.find(params[:id])
    end
    def create
       @user=User.new(user_params)
       if @user.save
        redirect_to @user
       else
        render "new"
       end 
    end
    

    def show
        @user=User.find(params[:id])
    end
end
