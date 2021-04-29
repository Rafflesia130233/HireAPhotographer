class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @skip_header = true;@skip_footer = true;
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else

      @conversation = Conversation.new
      @conversation.sender_id=params[:sender_id]
      @conversation.recipient_id=params[:recipient_id]

    end
    @conversation.save
=begin
    respond_to do |format|
      if @conversation.save
        #format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
        #render json: { conversation_id: @conversation.id }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
=end

    render json: { conversation_id: @conversation.id }
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.fetch(:conversation, {})
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end
  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
