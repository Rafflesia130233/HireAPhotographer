class HireDetailsController < ApplicationController
  before_action :set_hire_detail, only: [:show, :edit, :update, :destroy]

  # GET /hire_details
  # GET /hire_details.json
  def index
    @hire_details = HireDetail.all
  end

  # GET /hire_details/1
  # GET /hire_details/1.json
  def show
  end

  # GET /hire_details/new
  def new
    @hire_detail = HireDetail.new
  end

  # GET /hire_details/1/edit
  def edit
  end

  # POST /hire_details
  # POST /hire_details.json
  def create
    @hire_detail = HireDetail.new(hire_detail_params)
    @application = Application.find(@hire_detail.application_id)
    @application.status="HIRED";
    @application.save
    respond_to do |format|
      if @hire_detail.save
        format.html { redirect_to @hire_detail, notice: 'Hire detail was successfully created.' }
        format.json { render :show, status: :created, location: @hire_detail }
      else
        format.html { render :new }
        format.json { render json: @hire_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hire_details/1
  # PATCH/PUT /hire_details/1.json
  def update
    respond_to do |format|
      if @hire_detail.update(hire_detail_params)
        format.html { redirect_to @hire_detail, notice: 'Hire detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @hire_detail }
      else
        format.html { render :edit }
        format.json { render json: @hire_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hire_details/1
  # DELETE /hire_details/1.json
  def destroy
    @hire_detail.destroy
    respond_to do |format|
      format.html { redirect_to hire_details_url, notice: 'Hire detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hire_detail
      @hire_detail = HireDetail.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def hire_detail_params
      params.fetch(:hire_detail, {})
      params.require(:hire_detail).permit( :details,  :status,  :salary, :startdate,  :photographer_user_id, :customer_user_id, :application_id, :job_detail_id)


    end
end
