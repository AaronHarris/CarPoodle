class Rider < ActiveRecord::Base
  attr_accessible :driver_id, :name, :event_id, :telephone, :waitlist #, :waitlist_id
  belongs_to :driver 
  belongs_to :event
  # belongs_to :waitlist

  before_save :set_waitlist
  
  def set_waitlist
  	if self.driver_id.blank? then
  		self.waitlist ||= 1
  	else
  		self.waitlist ||= 0
  	end
  end

end
