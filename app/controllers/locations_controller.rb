class LocationsController < ApplicationController

before_filter :authenticate
	respond_to :json, :html

	def index 		
	end

	def new
		location_obj		
	end

	def create				
    # move to intilizers
    response=HTTParty.post(API_HOST+"/associates/location",{:body=>JSON.parse({:user=>params, :access_token => "#{session[:access_token]}"}.to_json)})
    response = JSON.parse(response.body)        

    if response["status"] == "success"
	    flash[:notice] = APP_MESSAGE["location_success"] 
	    redirect_to new_location_path
  	else
  		flash[:notice] = APP_MESSAGE["location_failed"] 
  		redirect_to new_sessions_path
  	end
	end

	def search		
		location_obj
		@locations = Location.find(:first, :conditions => "country = 'india'")

		assd = AssociateLocation.where("location_id = #{@locations.id}").group("associate_id").order("created_at")
		@associates = Associate.where(["id in (?)", assd.map(&:associate_id)])
	end

	private 
	def location_obj
		locations = Location.all										
		@addresses = locations.map(&:address).uniq.reject { |a| a.nil? }
		@countries = locations.map(&:country).uniq.reject { |c| c.nil? }
		@states = locations.map(&:state).uniq.reject { |s| s.nil? }
		@cities = locations.map(&:city).uniq.reject { |c| c.nil? }
	end
end
