class Location < ActiveRecord::Base
 attr_accessible  :address,:city,:state,:country,:pincode,:latitude,:longitude, :geocoder_service,:user_defined
end

