class Driver < ActiveRecord::Base
  attr_accessible :event_id, :name, :spots
  has_many :riders
  belongs_to :event
end
