module MatieresHelper
		#devrait etre bien gerer avec les role
  def matiere_author(matiere)
    user_signed_in? && current_user.id == matiere.user_id
  end
end
