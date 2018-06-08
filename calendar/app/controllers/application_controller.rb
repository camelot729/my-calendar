class ApplicationController < ActionController::Base
  before_action :set_time_zone, if: :user_signed_in?


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :password, :current_password])
  end

  private
  def set_time_zone
    Time.zone = current_user.time_zone
  end
end

