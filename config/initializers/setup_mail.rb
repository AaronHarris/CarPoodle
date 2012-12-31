ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:user_name => "carpoodledev", 
	:password => "CleanwebPoodle",
	:authentication => "plain", 
	:enable_starttls_auto => true
}

# ActionMailer::Base.default_url_options[:host] = "localhost:3000" 

# if Rails.env.development?
# ActionMailer::Base.default_url_options[:host] = "carpoodle.com" if Rails.env.production?


if Rails.env.production?
	ActionMailer::Base.default_url_options[:host] = "carpoodle.com" 
else 
	ActionMailer::Base.default_url_options[:host] = "localhost:3000" 
end