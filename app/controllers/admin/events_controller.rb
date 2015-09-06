class Admin::EventsController < AdminController

	before_filter :find_event, :only => [:destroy, :update, :edit]

	def index
		@events = Event.order('event_date ASC').page(params[:page]).per(15)
	end

	def new
		@event = Event.new
	end

	def edit
	
	end

	def create
		@event = Event.new event_attributes
		if @event.save
			flash[:notice] = 'Event successfully created'
			redirect_to admin_events_path
		else
			flash[:notice] = @event.errors.full_messages.join(", ")
			render action: 'new'
		end
	end

	def update
		if @event.update_attributes event_attributes
			flash[:notice] = 'Event successfully created'
			redirect_to admin_events_path
		else
			flash[:notice] = @event.errors.full_messages.join(", ")
			render action: 'edit'
		end
	end

	def destroy
		if @event.destroy
			flash[:notice] = 'Event successfully removed'
		else
			flash[:notice] = @event.errors.full_messages.join(", ")
		end
		redirect_to admin_events_path
	end

	private
		def event_attributes
			params.require(:event).permit(:name, :description, :category_id, :event_date)
		end

		def find_event
			@event = Event.find(params[:id])
		end

end