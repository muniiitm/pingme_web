module Pingme
  class Location
    class<<self
      def search(access_token,serach_key)
        response=HTTParty.get(API_HOST+"/locations",{:body=>JSON.parse({:header=>{:access_token=>access_token},:search=>serach_key}.to_json)})
        response = JSON.parse(response)
      end

      # create the location
      def create(access_token,params_data)
      	response=HTTParty.post(API_HOST+"/associates/location",{:body=>JSON.parse({:access_token => access_token, :user=>params_data}.to_json)})
        response = JSON.parse(response)
      end

      # to load the locations data for populate
      def populate_data(access_token)
      	response=HTTParty.get(API_HOST+"/locations/new",{:body=>JSON.parse({:access_token => access_token}.to_json)})
				response = JSON.parse(response)
      end

      def latitude_and_longitude(access_token)
        response=HTTParty.get(API_HOST+"/locations/latitude_and_longitude",{:body=>JSON.parse({:access_token => access_token}.to_json)})
        response = JSON.parse(response)
      end
    end
  end

  class Associate
    class<<self
      # get associates count
      def total
        response = HTTParty.get(API_HOST+"/associates/total")
        response = JSON.parse(response)
      end
    end
  end

  class Session
    class<<self
    	def create(params_data)
    		response=HTTParty.post(API_HOST+"/users/sign_in",{:body=>JSON.parse({:user=>params_data}.to_json)})
    		response = JSON.parse(response)
    	end
    end
  end
end