class JobDetailsController < ApplicationController
  before_action :set_job_detail, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  # GET /job_details
  # GET /job_details.json
  def index
    @filterrific = initialize_filterrific(
        JobDetail,
        params[:filterrific],
        :select_options => {
            sorted_by:JobDetail.options_for_sorted_by
        }
    ) or return
    @job_details = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end


  # GET /job_details/1
  # GET /job_details/1.json
  def show
  end

  # GET /job_details/new
  def new
    @job_detail = JobDetail.new
  end

  # GET /job_details/1/edit
  def edit
  end

  # POST /job_details
  # POST /job_details.json
  def create
    @job_detail = JobDetail.new(job_detail_params)
    if logged_in?
      #customer = @current_user.becomes(Customer::User)
      @job_detail.user = @current_user
    end
   #User.find(@current_user.username)

    respond_to do |format|
      if @job_detail.save
        format.html { redirect_to @job_detail, notice: 'Job detail was successfully created.' }
        format.json { render :show, status: :created, location: @job_detail }
      else
        format.html { render :new }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_details/1
  # PATCH/PUT /job_details/1.json
  def update
    respond_to do |format|
      if @job_detail.update(job_detail_params)
        format.html { redirect_to @job_detail, notice: 'Job detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_detail }
      else
        format.html { render :edit }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_details/1
  # DELETE /job_details/1.json
  def destroy
    @job_detail.destroy
    respond_to do |format|
      format.html { redirect_to job_details_url, notice: 'Job detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def has_owner?
    @owner = @job_detail.user
    puts @owner
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_detail
      @job_detail = JobDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_detail_params
      params.require(:job_detail).permit( :jobTitle, :validTill, :status, :hiredetail, :createdon, :salary, :jobRequirementId, :location, :startDate, :endDate, :min_salary, :max_salary, :hours_per_week, :min_rate, :max_rate, :user_id)
    end
end
