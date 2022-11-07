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
        # debugger
       @user=User.new(user_params)
       if @user.save
        redirect_to admin_user_path(@user)
       else
        render "new"
       end 
    end
    

    def show
        @user=User.find(params[:id])
    end
    def destroy
        @user=User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end
        
    private
    def user_params
        params.require(:user).permit(:first_name,:last_name, :email,:password,
             :password_confirmation,:phone_number, :image,:country_id,:state_id,:city_id )
    end
end
