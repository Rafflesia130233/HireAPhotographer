class Photographer::UsersController < ApplicationController
  before_action :set_photographer_user, only: [:show, :edit, :update, :destroy]

  # GET /photographer/users
  # GET /photographer/users.json
  def index
    @photographer_users = Photographer::User.all
  end

  # GET /photographer/users/1
  # GET /photographer/users/1.json
  def show
    @photographer_users = Photographer::User.find(params[:id])

  end

  # GET /photographer/users/new
  def new
    @photographer_user = Photographer::User.new
  end

  # GET /photographer/users/1/edit
  def edit
  end


  # POST /photographer/users
  # POST /photographer/users.json
  def create
    @photographer_user = Photographer::User.new(photographer_user_params)

    respond_to do |format|
      if @photographer_user.save
        format.html { redirect_to @photographer_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @photographer_user }
      else
        format.html { render :new }
        format.json { render json: @photographer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photographer/users/1
  # PATCH/PUT /photographer/users/1.json
  def update
    respond_to do |format|
      if @photographer_user.update(photographer_user_params)
        format.html { redirect_to @photographer_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @photographer_user }
      else
        format.html { render :edit }
        format.json { render json: @photographer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photographer/users/1
  # DELETE /photographer/users/1.json
  def destroy
    @photographer_user.destroy
    respond_to do |format|
      format.html { redirect_to photographer_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photographer_user
    @photographer_user = Photographer::User.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photographer_user_params
    params.fetch(:photographer_user, {})
    params.require(:photographer_user).permit(:username, :email, :password, :role, :status, :confirm_token, :user_id)
  end



  def profile
    if @current_user.profile.nil?
      @profile=Profile.new
    else
      @profile=@current_user.profile
    end
  end
end
