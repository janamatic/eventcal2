class Event < ActiveRecord::Base
  attr_accessible :photo, :tag_list, :address1, :address2, :start_time, :city, :description, :admission, :end_date, :end_time, :recurring, :event_date, :latitude, :longitude, :state, :title, :zip, :gmaps
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
  acts_as_gmappable

acts_as_gmappable
acts_as_taggable
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{self.zip}" 
  end



def gmaps4rails_infowindow
  # add here whatever html content you desire, it will be displayed when users clicks on the marker
  "<div style='font-size:10px'><a target='_blank' href='/events/#{self.id}'>#{self.title}</a><br/> #{self.event_date.try(:month)}/#{self.event_date.try(:day)}/#{self.event_date.try(:year)} #{self.start_time} <br/> #{self.address1}</div>"
end

end
