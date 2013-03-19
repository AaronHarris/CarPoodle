class Rider < ActiveRecord::Base
  attr_accessible :driver_id, :name, :event_id, :telephone, :waitlist
  belongs_to :driver 
  belongs_to :event

  before_save :set_waitlist
  
  def set_waitlist
  	if self.driver_id.blank? then
  		self.waitlist ||= 1
  	else
  		self.waitlist ||= 0
  	end
  end

  def update_waitlist
  	if self.driver_id.blank? then
  		update_attribute :waitlist, 1
  	else
  		update_attribute :waitlist, 0
  	end
  end

  def update_driver(driver_id)
  	update_attribute :driver_id, driver_id
  end

end
