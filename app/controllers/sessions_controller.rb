class SessionsController < ApplicationController

	def new
	end

	def create
    value=Base64.encode64("#{params[:user_id]} #{params[:password]}")
    # move to intilizers
    response=HTTParty.post("http://localhost:9393" +'/users/sign_in',{:body=>JSON.parse({:user=>value}.to_json)})
    response = JSON.parse(response.body)
    if response["response"]=="success"
      session[:access_token] = response["user"]["authentication_token"]
      cookies.signed[access_token]
      set_current_user
    end

  end
end