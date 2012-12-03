task :update_latlog => [:environment] do
     response=HTTParty.get(API_HOST+"/update_latlong?header[access_token]=access_token",{:body=>{}})
 end