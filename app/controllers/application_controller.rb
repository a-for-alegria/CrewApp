class ApplicationController < ActionController::Base
  # before_filter :redirect
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end   

  def signed_in?
		!current_user.nil?
  end
  
  def permited_user
    current_user.uid == '313528822190863'
  end
end
