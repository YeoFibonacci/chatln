class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_classrooms, only: [:index, :show, :new, :edit, :create]
  before_action :find_levels, only: [:index, :show, :new, :edit, :create]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :contact, :status])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :contact, :city, :school_name, 
                                                                :level_id, :status, :resume, :gender, :matricule,
                                                                 :matiere_shared, :avatar, :classroom_id, :slug, 
                                                                 :terms])
    end

    def sign_in_and_redirect(resource_or_scope,resource)
      if resource_or_scope == :user
        redirect_to edit_user_registration_path
      else
        super
      end
    end

private

def find_classrooms
  @classrooms = Classroom.all.order('created_at desc')
end

def find_levels
 @levels = Level.all.order('created_at desc')
end
end
