class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # skip_before_action :authenticate_user!, :only => [:index]
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name, :email,:password, :password_confirmation,:phone_number, :image,:country_id,:state_id,:city_id )}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:last_name, :email,:password,:current_password, :password_confirmation,:phone_number, :image,:country_id,:state_id,:city_id )}
        end
end
