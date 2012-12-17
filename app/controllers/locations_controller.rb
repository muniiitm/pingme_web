class LocationsController < ApplicationController

	before_filter :authenticate
	respond_to :json, :html

	def index 		
	end

	def new
		response=HTTParty.get(API_HOST+"/locations",{:body=>JSON.parse({:access_token => "#{session[:access_token]}"}.to_json)})
    response = JSON.parse(response.body)    
    if response["status"] == "success" 
    	@addresses = response["addresses"]
    	@countries = response["countries"]
    	@states = response["states"]
    	@cities = response["cities"]
    else
    	token_mismatch
    end
	end

	def create				
    # move to intilizers
    response=HTTParty.post(API_HOST+"/associates/location",{:body=>JSON.parse({:user=>params, :access_token => "#{session[:access_token]}"}.to_json)})
    response = JSON.parse(response.body)            
    if response["status"] == "success"    	
	    flash[:notice] = APP_MESSAGE["location_success"] 
	    redirect_to new_location_path
	  elsif response["status"] == "date_field_empty"
	  	flash[:notice] = APP_MESSAGE["date_field_empty"] 
	  	redirect_to new_location_path
  	else
  		token_mismatch
  	end
	end

  def search_result
    response=HTTParty.get(API_HOST+"/locations",{:body=>JSON.parse({:search=>params[:search], :access_token => "#{session[:access_token]}"}.to_json)})
    response = JSON.parse(response)
    render :partial => "locations/search_result",:locals=>{:associates=>response}
  end

	private
	
	def token_mismatch
		reset_session
		flash[:notice] = APP_MESSAGE["token_mismatch"]   		
		redirect_to new_sessions_path
	end	
end
