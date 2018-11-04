class WorksController < ApplicationController
  before_action :authenticate

  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  # GET /works.json
  def index
    @works = Work.where("user_id = ?", current_user.id).order(:sort)
    @expiredWorks = @works.joins(:due).where("dueDate < ?", Time.zone.today)
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
    @work.build_due
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id
    respond_to do |format|
      if @work.save
        format.html { redirect_to works_path }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to works_path }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1/completion
  # PATCH/PUT /works/1/completion.json
  def completion
    @work = Work.find(params[:id])
    @work.completion = true
    @work.save
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:user_id, :title, :content, :completion, due_attributes: [:id, :dueDate])
    end
end
