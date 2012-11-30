class LocationsController < ApplicationController

	before_filter :authenticate

	def index	
		@locations = []
	end

	def create				
    # move to intilizers
    response=HTTParty.post(API_HOST+"/associates/location",{:body=>JSON.parse({:user=>params, :access_token => "#{session[:access_token]}"}.to_json)})
    response = JSON.parse(response.body)         
    flash[:notice] = APP_MESSAGE["location_success"] if response["status"] == "success"
    redirect_to locations_path
	end
end
