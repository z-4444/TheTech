# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  # def create
  #   @user = User.find_by_email(sign_in_params[:email])
  #   # UserMailer.signed_up(user).deliver_later
  #   if @user.active?
  #     super
  #   else
  #     flash[:alert]="wait you are in pendding list"
  #     redirect_to new_user_session_path
  #   end
  #   # super 
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
