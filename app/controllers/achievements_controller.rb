class AchievementsController < ApplicationController
  before_action :set_achievement, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  # GET /achievements or /achievements.json
  def index
    add_breadcrumb("Achievements")
    @achievements = Achievement
                      .accessible_by(current_ability)
                      .where(subscription_id: params.dig(:q, :subscription_id_eq))
  end

  # GET /achievements/1 or /achievements/1.json
  def show
    add_breadcrumb("Achievements", achievements_path)
    add_breadcrumb(@achievement.id)
  end

  # GET /achievements/new
  def new
    add_breadcrumb("Achievements", achievements_path)
    add_breadcrumb("New")

    @achievement = Achievement.new(subscription_id: params[:subscription_id])
  end

  # GET /achievements/1/edit
  def edit
    add_breadcrumb("Achievements", achievements_path)
    add_breadcrumb(@achievement.id, @achievement)
    add_breadcrumb("Edit")
  end

  # POST /achievements or /achievements.json
  def create
    @achievement = Achievement.new(achievement_params)

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to achievement_url(@achievement), notice: "Achievement was successfully created." }
        format.json { render :show, status: :created, location: @achievement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievements/1 or /achievements/1.json
  def update
    respond_to do |format|
      if @achievement.update(achievement_params)
        format.html { redirect_to achievement_url(@achievement), notice: "Achievement was successfully updated." }
        format.json { render :show, status: :ok, location: @achievement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1 or /achievements/1.json
  def destroy
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url, notice: "Achievement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def achievement_params
      params.require(:achievement).permit(:concluded_at, :subject_id, :subscription_id)
    end
end
