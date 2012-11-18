class Waitlist < ActiveRecord::Base
  attr_accessible :event_id
  has_many :riders
  belongs_to :event
end
