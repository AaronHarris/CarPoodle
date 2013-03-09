class Driver < ActiveRecord::Base
  attr_accessible :event_id, :name, :spots, :telephone
  has_many :riders
  belongs_to :event 
end
