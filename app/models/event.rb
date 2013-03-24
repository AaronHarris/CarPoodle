class Event < ActiveRecord::Base
	obfuscate_id :spin => 75832164

  attr_accessible :name, :description, :time, :place, :admin, :email
  has_many :drivers 
  has_many :riders

  validates_presence_of :name, :admin, :email
  validates_format_of :email, with: /\A\S+@\S+\z/,  message: "Please use a valid email"
  # in future, use validates_email_format_of gem

  def private_email
  	email.first + "***" + email.match(/@.*/).to_s if email
  end
end
