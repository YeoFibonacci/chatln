class Matiere < ApplicationRecord

	 #RELATIONS
  has_many :courses
  has_many :users, through: :courses

#VALIDATES (validates presence: true )
	validates :matiere, :slug, presence: true,
							length: { minimum: 3, maximum:25 }

	#SLUG
	extend FriendlyId
	  friendly_id :matiere, use: [:slugged, :finders]

	def should_generate_new_friendly_id?
	    matiere_changed?
	end 
end
