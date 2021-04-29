class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
    @rejectedAppllications= Application.where("applications.status =?", "rejected").joins(:job_detail).where("job_details.user_id =?",current_user.id )
    @newAppllications = Application.where("applications.status =?", "new").joins(:job_detail).where("job_details.user_id =?",current_user.id )
    @inprogressAppllications =Application.where("applications.status =?", 'inprogress').joins(:job_detail).where("job_details.user_id =?",current_user.id )
    @myAppllications =Application.where("applications.user_id =?",current_user.id)
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    if logged_in?
      user = @current_user
      @application.user = user
    end
    job = JobDetail.find_by(id:@application.job_detail_id)
    @application.job_detail = job
    @application.status='new'
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.fetch(:application, {})
      params.require(:application).permit(:coverletter,:availablefrom,:expectedsalary,:job_detail_id,:submitted, :status ,:user_id)
    end
end
