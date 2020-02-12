class MatieresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_matiere, only: [:show, :edit, :update, :destroy]

  # GET /matieres
  # GET /matieres.json
  def index
    @matieres = Matiere.all
    @courses = Course.all.order('created_at desc')
  end

  # GET /matieres/1
  # GET /matieres/1.json
  def show
    @courses = Course.where('matiere_id = ?', @matiere.id)
  end

  # GET /matieres/new
  def new
    @matiere = current_user.matieres.build
  end

  # GET /matieres/1/edit
  def edit
  end

  # POST /matieres
  # POST /matieres.json
  def create
    @matiere = current_user.matieres.build(matiere_params)

    respond_to do |format|
      if @matiere.save
        format.html { redirect_to matieres_path, notice: 'Vous avez crée une matière.' }
        format.json { render :show, status: :created, location: @matiere }
      else
        format.html { render :new }
        format.json { render json: @matiere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matieres/1
  # PATCH/PUT /matieres/1.json
  def update
    respond_to do |format|
      if @matiere.update(matiere_params)
        format.html { redirect_to @matiere, notice: 'Mise à jour effectuée avec succes.' }
        format.json { render :show, status: :ok, location: @matiere }
      else
        format.html { render :edit }
        format.json { render json: @matiere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matieres/1
  # DELETE /matieres/1.json
  def destroy
    @matiere.destroy
    respond_to do |format|
      format.html { redirect_to matieres_url, notice: 'La matiere est completement supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matiere
      @matiere = Matiere.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matiere_params
      params.require(:matiere).permit(:matiere, :slug, :user_id)
    end
end
