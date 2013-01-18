class SessionsController < ApplicationController

	def new   
    # response = Pingme::location.create(value) 
    # total_associates = response["total_associates"] 
    redirect_to locations_path if current_user
	end

	def create
    if params[:user_id].nil? || params[:password].nil?
      flash[:notice] = APP_MESSAGE["sign_in_failed"]
      redirect_to new_sessions_path 
    else
      value=Base64.encode64("#{params[:user_id]} #{params[:password]}")
      response = Pingme::Session.create(value) 
      
      if response["status"] == "success"      
        session[:associate_name] =  "#{response['user']['associate']['first_name']} #{response['user']['associate']['last_name']}"
        session[:access_token] = response["access_token"]
        cookies.signed[access_token]
        # set the current user
        # current_user 
        flash[:notice] = APP_MESSAGE["sign_in_success"]
        redirect_to  new_location_path # redirect to location URL
      else      
        flash[:notice] = APP_MESSAGE["sign_in_failed"]
        redirect_to new_sessions_path 
      end    
    end
  end

  def sign_out
    reset_session
    redirect_to new_sessions_path 
  end
end