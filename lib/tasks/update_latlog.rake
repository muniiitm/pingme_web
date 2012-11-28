task :update_latlog => [:environment] do
     response=HTTParty.get("http://localhost:9292"+"/update_latlong?header[access_token]=access_token",{:body=>{}})
 end