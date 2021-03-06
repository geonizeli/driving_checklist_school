class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  # GET /subjects or /subjects.json
  def index
    add_breadcrumb("Subjects")

    @subjects = Subject.all
  end

  # GET /subjects/1 or /subjects/1.json
  def show
    add_breadcrumb("Subjects", subjects_path)
    add_breadcrumb(@subject.id)
  end

  # GET /subjects/new
  def new
    add_breadcrumb("Subjects", subjects_path)
    add_breadcrumb("New")

    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
    add_breadcrumb("Subjects", subjects_path)
    add_breadcrumb(@subject.id, subject_path(@subject))
    add_breadcrumb("Edit")
  end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subject_url(@subject), notice: "Subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subject_url(@subject), notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    respond_to do |format|
      if @subject.destroy
        format.html { redirect_to subjects_url, notice: "Subject was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name, :min_hours)
    end
end
