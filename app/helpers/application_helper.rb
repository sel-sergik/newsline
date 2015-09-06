module ApplicationHelper

	#check namespace
	def namespace_admin?
		controller.class.name.split("::").first=="Admin"
	end

	#classification controller in admin panel
	def classification_controller(name)
		controller_name.classify == name ? 'active' : ''
	end

	#list of participants event with a limited number
	def event_subscribers_with_name(event, limit=nil)
		subscriber_str = ''
		unless limit.nil?
			subscribers = event.users.limit(limit)
		else
			subscribers = event.users
		end
		subscribers.each do |subscriber|
			subscriber_str += subscriber.fullname + ', '
		end	
		subscriber_str[0..subscriber_str.length - 3]
	end
end
