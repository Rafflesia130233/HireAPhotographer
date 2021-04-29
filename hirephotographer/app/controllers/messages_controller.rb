class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]



  # POST /messages
  # POST /messages.json
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!

    @path = conversation_path(@conversation)
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.fetch(:message, {})
      params.require(:message).permit(:body, :user_id)
    end
end
