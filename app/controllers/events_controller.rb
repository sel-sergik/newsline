class EventsController < ApplicationController
	def show
		@event = Event.find(params[:id])
	end

	#add participant to event
	def add_event_subscriber
		event = Event.find(params[:id])
		user = User.find(params[:user_id])
		if !event.users.exists?(user.id)
			event.users << user
			@del = true
		else
			event.users.delete(user)
			@del = false
		end
	end
end