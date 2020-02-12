class Level < ApplicationRecord

	#RELATIONS
has_many :courses
has_many :users
has_many :matieres, through: :courses

  
#VALIDATES
validates :title, :slug, presence: true,
						 length: {minimum: 2, maximum: 25}
						 

#SLUG LEVEL
extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
