class Customer::UsersController < ApplicationController
  before_action :set_customer_user, only: [:show, :edit, :update, :destroy]

  # GET /customer/users
  # GET /customer/users.json
  def index
    @customer_users = Customer::User.all
  end

  # GET /customer/users/1
  # GET /customer/users/1.json
  def show
    @postedValidJobs = JobDetail.where("user_id = ? AND validTill >= ?",@customer_user.id, Date.today)
    @postedInValidJobs = JobDetail.where("user_id = ? AND validTill < ?",@customer_user.id, Date.today)
  end

  # GET /customer/users/new
  def new
    @customer_user = Customer::User.new
  end

  # GET /customer/users/1/edit
  def edit
  end

  # POST /customer/users
  # POST /customer/users.json
  def create
    @customer_user = Customer::User.new(customer_user_params)

    respond_to do |format|
      if @customer_user.save
        format.html { redirect_to @customer_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @customer_user }
      else
        format.html { render :new }
        format.json { render json: @customer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer/users/1
  # PATCH/PUT /customer/users/1.json
  def update
    respond_to do |format|
      if @customer_user.update(customer_user_params)
        format.html { redirect_to @customer_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_user }
      else
        format.html { render :edit }
        format.json { render json: @customer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/users/1
  # DELETE /customer/users/1.json
  def destroy
    @customer_user.destroy
    respond_to do |format|
      format.html { redirect_to customer_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_user
      @customer_user = Customer::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_user_params
      params.fetch(:customer_user, {})
      params.require(:customer_user).permit(:username, :email, :password, :role, :status, :confirm_token)
    end
end
