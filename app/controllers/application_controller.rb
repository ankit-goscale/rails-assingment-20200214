class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, if: :authenticate?

  protected
  def after_sign_in_path_for(user)
    tweets_path
  end

  def after_sign_out_path_for(user)
    root_path
  end

  private
  def authenticate?
    !devise_controller? and !(params[:controller] == 'home')
  end
end
