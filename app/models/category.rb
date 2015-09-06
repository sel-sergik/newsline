class Category < ActiveRecord::Base
	#for the tree structure
	acts_as_nested_set
	
	has_many :events
	validates :name, presence: true
end
