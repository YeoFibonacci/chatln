class HomeController < ApplicationController
  before_action :find_matieres, only: [:index, :show, :new, :edit, :create]
 before_action :find_levels, only: [:index, :show, :new, :edit, :create]
	# selectionner les courses en fonction du niveau de l'eleve
  def index
  	@courses = Course.order('created_at desc')
    @matieres = Matiere.all
  end

  def show	
  end
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :content, :user_id, :matiere_id, :level_id)
    end

    def find_matieres
      @matieres = Matiere.all.order('created_at desc')
    end

    def find_levels
      @levels = Level.all.order('created_at desc')
    end
  
end
