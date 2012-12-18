module Pingme
  class Location
    class<<self
      def search(access_token,serach_key)
        response=HTTParty.get(API_HOST+"/locations",{:body=>JSON.parse({:header=>{:access_token=>access_token},:search=>serach_key}.to_json)})
        response = JSON.parse(response)
      end
    end
  end
end