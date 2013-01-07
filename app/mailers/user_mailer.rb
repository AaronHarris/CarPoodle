class UserMailer < ActionMailer::Base
  default from: "carpoodleapp@gmail.com"

  def event_confirmation(event) 
  	@event = event

  	mail(:to => "#{event.admin} <#{event.email}>", :subject => "Your Carpoodle has been created.")
  end
end
