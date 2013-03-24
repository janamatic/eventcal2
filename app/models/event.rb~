class Event < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :description, :latitude, :longitude, :state, :title, :zip, :gmaps
  

  acts_as_gmappable

acts_as_gmappable

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{self.zip}" 
  end





end
