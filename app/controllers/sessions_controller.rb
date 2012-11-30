class SessionsController < ApplicationController

	def new    
    redirect_to locations_path if current_user
	end

	def create    
    value=Base64.encode64("#{params[:user_id]} #{params[:password]}")
    # move to intilizers
    response=HTTParty.post(API_HOST+"/users/sign_in",{:body=>JSON.parse({:user=>value}.to_json)})
    response = JSON.parse(response.body)    
    if response["status"] == "success"
      session[:user_id] = response["user"]["user_id"]
      session[:access_token] = response["access_token"]
      cookies.signed[access_token]
      # set the current user
      current_user 
      redirect_to locations_path # redirect to location URL
    else
      redirect_to new_session_path 
    end
    
  end

  def sign_out
    reset_session
    redirect_to new_sessions_path 
  end
end