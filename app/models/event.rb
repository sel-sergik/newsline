class Event < ActiveRecord::Base
	belongs_to :category
	has_and_belongs_to_many :users
	validates :name, :description, :category_id, :event_date, presence: true

	#short description for event
	def short_description
		self.description[0..200] + '...'
	end
end
