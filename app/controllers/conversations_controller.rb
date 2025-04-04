class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def show
    @conversation = Conversation.find(params[:id])
    if @conversation.sender == current_user || @conversation.receiver == current_user
      @messages = @conversation.messages.order(:created_at)
    else
      redirect_to conversations_path, alert: "Unauthorized"
    end
  end

  def create
    conversation = Conversation.find_or_create_by(sender_id: current_user.id, receiver_id: params[:receiver_id])
    redirect_to conversation_path(conversation)
  end
end
