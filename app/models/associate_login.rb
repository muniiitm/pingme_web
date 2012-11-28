class AssociateLogin < ActiveRecord::Base
  attr_accessible :associate_id, :location_id, :login_ip, :login_latitude, :login_longitude
end
