class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
		#add custom parameters
		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) << :firstname
			devise_parameter_sanitizer.for(:sign_up) << :lastname
			devise_parameter_sanitizer.for(:account_update) << :firstname
			devise_parameter_sanitizer.for(:account_update) << :lastname
			devise_parameter_sanitizer.for(:account_update) << :avatar
			devise_parameter_sanitizer.for(:account_update) << :avatar_cache
		end

		def user_params
	    params.require(:user).permit(:email, :password, :avatar, :avatar_cache, :remove_avatar)
	  end
end
