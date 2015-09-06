class HomeController < ApplicationController
	
	def index
		@events = Event.order('event_date ASC')
		if params[:category_id].present?
			categories_array = Category.find(params[:category_id]).self_and_descendants.map {|c| c.id}
			@events = @events.where('category_id in (?)', categories_array)
		end
		if params[:user_id].present? && params[:user_id].to_i > 0
			@events = @events.joins(:users).where(users: {id: params[:user_id].to_i})
		end
		@events = @events.page(params[:page]).per(15)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def angular_test
		render :layout => false
	end
end