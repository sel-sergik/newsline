class UsersController < ApplicationController
	
	private
		def user_params
	    params.require(:user).permit(:email, :password, :avatar, :avatar_cache, :remove_avatar)
	  end
end
