class UsersController < ApplicationController
 before_action :authenticate_user!
  before_action :set_user, only:[ :show, :edit, :update]


  def show
    @courses = @user.courses.order('created_at desc')
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private
   def set_user     
    @user  = User.find(params[:id])
   end

  def user_params
    params.require(:user).permit(:username, :contact, :city, :school_name, 
                                 :level_id, :status, :resume, :gender, :matricule,
                                 :matiere_shared, :avatar, :classroom_id, :slug)
  end	
end	
