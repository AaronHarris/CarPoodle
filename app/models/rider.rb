class Rider < ActiveRecord::Base
  attr_accessible :driver_id, :name, :waitlist_id
  belongs_to :driver 
  belongs_to :waitlist 
end
