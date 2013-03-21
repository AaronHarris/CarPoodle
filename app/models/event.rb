class Event < ActiveRecord::Base
	obfuscate_id :spin => 75832164

  attr_accessible :name, :description, :time, :place, :admin, :email
  has_many :drivers 
  has_many :riders

  validates_presence_of :name, :admin, :email
end
