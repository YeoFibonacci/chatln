class Course < ApplicationRecord
	#RELATIONS
belongs_to :matiere
belongs_to :user
belongs_to :level
has_many :comments , dependent: :destroy



#VALIDATES (validates presence: true )
validates :title,
		  :content,
		  :slug, 
		  :matiere_id,
		  :level_id,
		  :user_id, presence: true



#SLUG COURSE
extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

end
