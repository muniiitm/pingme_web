class ApplicationController < ActionController::Base
  protect_from_forgery
  #~ before_filter :set_current_user
  def access_token
    @access_token=session[:access_token]
  end
  
  def set_current_user   
    Associate.current = current_user
  end
  
  def current_user
    @current_user ||= Associate.find_by_user_name(session[:access_token]) if session[:access_token] # Use find_by_user_name to get nil instead of an error if user doesn't exist
  end
end
