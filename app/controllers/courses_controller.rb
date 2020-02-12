class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :find_matieres, only: [:index, :show, :new, :edit, :create]
  before_action :find_levels, only: [:index, :show, :new, :edit, :create]

  # GET /courses
  # GET /courses.json
  def index

    @courses = Course.all.order('created_at desc')
    @matieres = Matiere.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @courses = Course.all.order('created_at desc')    
  end

  # GET /courses/new
  def new
    @course = current_user.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  # def create
  def create
    @course = current_user.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Cours crée avec succes.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Cours mise a jour avec success..' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Cours supprimé avec success.' }
      format.json { head :no_content }
    end
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
