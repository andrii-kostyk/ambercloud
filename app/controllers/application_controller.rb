class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if session[:user]
  	  @current_user ||= User.find_by_uuid(session[:user]["uuid"])
    end
  end
  helper_method :current_user

  def authorize
    redirect_to signin_path unless current_user
  end
end
