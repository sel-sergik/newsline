class AdminController < ApplicationController

	before_action :authorize_admin

	private
		#access to admin panel
		def authorize_admin
			unless current_user.try(:admin?)
				flash[:notice] = "You do not have access to the administrative panel!"
		  	redirect_to root_path
			end
		end
end