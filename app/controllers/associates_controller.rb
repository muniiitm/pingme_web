class AssociatesController < ApplicationController
	def index
	end

	def login		
		begin 
			response = RestClient.post "http://localhost:9292", params.to_json, :content_type => :json, :accept => :json
			@response_json = JSON.parse(response)
		rescue => e
			
		end
	end	
end
