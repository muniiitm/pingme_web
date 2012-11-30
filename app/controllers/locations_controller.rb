class LocationsController < ApplicationController

	before_filter :authenticate

	def index	
		@locations = []
	end

	def create				
    # move to intilizers
    response=HTTParty.post("http://localhost:9292/associates/location",{:body=>JSON.parse({:user=>params, :access_token => "#{session[:access_token]}"}.to_json)})
    response = JSON.parse(response.body)         
    flash[:notice] = "Loacation added successfully" if response["status"] == "success"
    redirect_to locations_path
	end
end
