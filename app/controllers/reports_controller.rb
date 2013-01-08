class ReportsController < ApplicationController
	
	before_filter :authenticate

	def carousel
  end

  def heat_map
    response = Pingme::Location.latitude_and_longitude(session[:access_token])    
    if response["status"] == "success"
      lat_and_lon = response["lat_and_lon"]    
      @associate_location = []
      lat_and_lon.inject({}) { |h, e| h['coords'] = [e[0],e[1]]; @associate_location << h; h }    
    else
      token_mismatch
    end
  end

  def google_map
  	@locations_json = Location.all.to_gmaps4rails	
  end

  def login          
  end
end