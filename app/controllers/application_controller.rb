class ApplicationController < ActionController::Base
	protect_from_forgery
=begin
	unless  Rails.application.config.consider_all_requests_local
	  rescue_from Exception, :with => :render_404
	end

	private

	def render_404
		render :template => 'public/404', :layout => false, :status => :not_found
		# raise ActionController::RoutingError.new('Not Found')
	end
=end
end
