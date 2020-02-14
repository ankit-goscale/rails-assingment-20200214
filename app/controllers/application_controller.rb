class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, if: :authenticate?


  private
  def authenticate?
    !devise_controller? and !(params[:controller] == 'home')
  end
end
