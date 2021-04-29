class ProfilepicturesController < ApplicationController
  before_action :set_profilepicture, only: [:show, :edit, :update, :destroy]

  # GET /profilepictures
  # GET /profilepictures.json
  def index
    @profilepictures = Profilepicture.all
  end

  # GET /profilepictures/1
  # GET /profilepictures/1.json
  def show
  end

  # GET /profilepictures/new
  def new
    @profilepicture = Profilepicture.new
  end

  # GET /profilepictures/1/edit
  def edit
  end

  # POST /profilepictures
  # POST /profilepictures.json
  def create
    @profilepicture = Profilepicture.new(profilepicture_params)

=begin

    encoded_picture = profilepicture_params[:data]
    content_type = profilepicture_params[:content_type]
    image = Paperclip.io_adapters.for("data:#{content_type};base64,#{encoded_picture}")
    image.original_filename = profilepicture_params[:original_filename]
    @profilepicture.imagedata = image
=end

    if !current_user.personalinformation.nil?
      @profilepicture.personalinformation = current_user.personalinformation
    end
    respond_to do |format|
      if @profilepicture.save
        format.html { redirect_to @profilepicture, notice: 'Profilepicture was successfully created.' }
        format.json { render :show, status: :created, location: @profilepicture }
      else
        format.html { render :new }
        format.json { render json: @profilepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profilepictures/1
  # PATCH/PUT /profilepictures/1.json
  def update
    respond_to do |format|
      if @profilepicture.update(profilepicture_params)
        format.html { redirect_to @profilepicture, notice: 'Profilepicture was successfully updated.' }
        format.json { render :show, status: :ok, location: @profilepicture }
      else
        format.html { render :edit }
        format.json { render json: @profilepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profilepictures/1
  # DELETE /profilepictures/1.json
  def destroy
    @profilepicture.destroy
    respond_to do |format|
      format.html { redirect_to profilepictures_url, notice: 'Profilepicture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profilepicture
      @profilepicture = Profilepicture.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profilepicture_params
      params.fetch(:profilepicture, {})
      params.require(:profilepicture).permit(:avatar, :personalinformation_id)
    end
end
