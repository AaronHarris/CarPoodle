class Driver < ActiveRecord::Base
	obfuscate_id :spin => 50415581

  attr_accessible :event_id, :name, :spots, :telephone, :full
  has_many :riders
  belongs_to :event 

  before_save :set_full
	def set_full
		if (self.spots > self.riders.size) 
			self.full ||= 0
		else
			self.full ||= 1
		end
	end

	def update_full
		if (self.spots > self.riders.size) 
			update_attribute :full, 0
		else
			update_attribute :full, 1
		end
	end
end
