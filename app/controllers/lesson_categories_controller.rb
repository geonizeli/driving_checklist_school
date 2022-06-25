class LessonCategoriesController < ApplicationController
  before_action :set_lesson_category, only: %i[ show edit update destroy ]

  # GET /lesson_categories or /lesson_categories.json
  def index
    @lesson_categories = LessonCategory.all.order(created_at: :asc)
  end

  # GET /lesson_categories/1 or /lesson_categories/1.json
  def show
  end

  # GET /lesson_categories/new
  def new
    @lesson_category = LessonCategory.new
  end

  # GET /lesson_categories/1/edit
  def edit
  end

  # POST /lesson_categories or /lesson_categories.json
  def create
    @lesson_category = LessonCategory.new(lesson_category_params)

    respond_to do |format|
      if @lesson_category.save
        format.html { redirect_to lesson_category_url(@lesson_category), notice: "Lesson category was successfully created." }
        format.json { render :show, status: :created, location: @lesson_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_categories/1 or /lesson_categories/1.json
  def update
    respond_to do |format|
      if @lesson_category.update(lesson_category_params)
        format.html { redirect_to lesson_category_url(@lesson_category), notice: "Lesson category was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_categories/1 or /lesson_categories/1.json
  def destroy
    @lesson_category.destroy

    respond_to do |format|
      format.html { redirect_to lesson_categories_url, notice: "Lesson category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_category
      @lesson_category = LessonCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_category_params
      params.require(:lesson_category).permit(:name)
    end
end
