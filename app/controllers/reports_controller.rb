class ReportsController < ApplicationController
	
	before_filter :authenticate

	def carousel
  end

  def heat_map
  end

  def google_map
  	@locations_json = Location.all.to_gmaps4rails	
  end

  def login          
  end
end