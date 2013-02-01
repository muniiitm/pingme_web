class LocationsController < ApplicationController

	before_filter :authenticate,:except=>['home']
	respond_to :json, :html

	def index
		location_data_for_populate
	end

	def new
		location_data_for_populate
	end

	def create
    response = Pingme::Location.create(session[:access_token],params)
    p response
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
    response = Pingme::Location.search(session[:access_token],params[:search])
    render :partial => "locations/search_result",:locals=>{:associates=>response}
  end

  def home
  end
	private

	def location_data_for_populate
		response =  Pingme::Location.populate_data(session[:access_token])
    p response
		if response["status"] == "success"
			@addresses = response["addresses"]
			@countries = response["countries"]
			@states = response["states"]
			@cities = response["cities"]
		else
			token_mismatch
		end
	end

end
