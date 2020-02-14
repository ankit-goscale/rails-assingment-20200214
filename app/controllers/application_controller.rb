class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, if: :authenticate?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(user)
    tweets_path
  end

  def after_sign_out_path_for(user)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end

  private
  def authenticate?
    !devise_controller? and !(params[:controller] == 'home')
  end
end
