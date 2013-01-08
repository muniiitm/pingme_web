class ApplicationController < ActionController::Base
  protect_from_forgery

  def access_token
    @access_token=session[:access_token]
  end  
  
  def current_user
    @current_user = nil
    @current_user ||= Associate.find_by_user_id(session[:user_id]) if session[:access_token] # Use find_by_user_name to get nil instead of an error if user doesn't exist
  end

  def authenticate
  	redirect_to new_sessions_path unless session[:access_token]
  end

  def token_mismatch
    reset_session
    flash[:notice] = APP_MESSAGE["token_mismatch"]      
    redirect_to new_sessions_path
  end 
  
end
