class LocationsController < ApplicationController

	before_filter :authenticate

	def index			
		locations = Location.all

		@countries = locations.map(&:country).uniq.reject { |c| c.nil? }
		@states = locations.map(&:state).uniq.reject { |s| s.nil? }
		@cities = locations.map(&:city).uniq.reject { |c| c.nil? }
	end

	def create				
    # move to intilizers
    response=HTTParty.post(API_HOST+"/associates/location",{:body=>JSON.parse({:user=>params, :access_token => "#{session[:access_token]}"}.to_json)})
    response = JSON.parse(response.body)    
    
    if response["status"] == "success"
	    flash[:notice] = APP_MESSAGE["location_success"] 
	    redirect_to locations_path
  	else
  		flash[:notice] = APP_MESSAGE["location_failed"] 
  		redirect_to new_sessions_path
  	end
	end
end
