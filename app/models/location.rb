class Location < ActiveRecord::Base
  acts_as_gmappable
  attr_accessible :address  

  def gmaps4rails_address
  	address
  end  

  def gmaps4rails_infowindow
    "<h4>#{address}</h4	> <h4>#{city}</h4> <h4>#{state}</h4> <h4>#{country}</h4>"
  end

end

