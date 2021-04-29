class PersonalinformationsController < ApplicationController
  before_action :set_personalinformation, only: [:show, :edit, :update, :destroy]


  def search

    @filterrific = initialize_filterrific(
        Personalinformation,
        params[:filterrific],
        :select_options => {
            sorted_by:Personalinformation.options_for_sorted_by
        }
    ) or return
    @personalinformations = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end
  # GET /personalinformations
  # GET /personalinformations.json
  def index
   # @personalinformations = Personalinformation.all
    @filterrific = initialize_filterrific(
        Personalinformation,
        params[:filterrific],
        :select_options => {
            sorted_by:Personalinformation.options_for_sorted_by
        }
    ) or return
    @personalinformations = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /personalinformations/1
  # GET /personalinformations/1.json
  def show
  end

  # GET /personalinformations/new
  def new
    @personalinformation = Personalinformation.new
  end

  # GET /personalinformations/1/edit
  def edit
  end

  # POST /personalinformations
  # POST /personalinformations.json
  def create
    @personalinformation = Personalinformation.new(personalinformation_params)

    if logged_in?
      user = @current_user
      @personalinformation.user = user

        @personalinformation.photographer_user_id = user.id;

    end
    respond_to do |format|
      if @personalinformation.save
        format.html { redirect_to @personalinformation, notice: 'Personalinformation was successfully created.' }
        format.json { render :show, status: :created, location: @personalinformation }
      else
        format.html { render :new }
        format.json { render json: @personalinformation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personalinformations/1
  # PATCH/PUT /personalinformations/1.json
  def update
    respond_to do |format|
      if @personalinformation.update(personalinformation_params)
        format.html { redirect_to @photographer_users, notice: 'Personalinformation was successfully updated.' }
        format.json { render :show, status: :ok, location: @photographer_users }
      else
        format.html { render :edit }
        format.json { render json: @personalinformation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personalinformations/1
  # DELETE /personalinformations/1.json
  def destroy
    @personalinformation.destroy
    respond_to do |format|
      format.html { redirect_to personalinformations_url, notice: 'Personalinformation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_personalinformation
    @personalinformation = Personalinformation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def personalinformation_params
    params.fetch(:personalinformation, {})
    params.require(:personalinformation).permit(:firstname, :lastname, :dateofbirth, :address, :city, :country, :nationalid,:mobile, :phone, :secondaryEmail, :user_Id, :photographer_user_id)

  end
end
