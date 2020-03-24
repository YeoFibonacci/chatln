module ApplicationHelper
	# Retourner un titre basé sur la page.
  def title
    base_title = "CHATLN"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end


	#Notification
  def bootstrap_status_class(status)
    status_hash = { "notice" => "info", "alert" => "danger" }
    status_hash[status].nil? ? status : status_hash[status]
  end

#admin
  #devrait etre bien gerer avec les role
  def admin_role(current_user)
    user_signed_in? && current_user.email == 'admin@gmail.com'
  end

  #status
  #revoir la  condition
  def status_user(current_user)
   user_signed_in? && current_user.status == "1" || current_user.email == 'admin@gmail.com'
    
  end

  #acces features
  def (current_user)
    user_signed_in? && current_user.id == course.user_id ||
  end
end
