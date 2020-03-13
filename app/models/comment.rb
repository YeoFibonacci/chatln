class Comment < ApplicationRecord
	
	#RELATIONS
  belongs_to :course
  belongs_to :user


  #VALIDAES PARAMETRES COMMENT
  validates :course_id, :content, presence:true
  #validates :content, length: { minimum: 1}# analyse la taille des commentaires
end
