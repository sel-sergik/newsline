class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable
	validates :firstname, :lastname, presence: true
	has_and_belongs_to_many :events
	mount_uploader :avatar, AvatarUploader

	# Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :avatar, :avatar_cache, :remove_avatar

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

	# show full name
	def fullname
		"#{firstname} #{lastname}"
	end
end
