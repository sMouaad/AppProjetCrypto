class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def create
    # Find or create the conversation
    conversation = Conversation.find_or_create_by(
      sender_id: [ current_user.id, params[:receiver_id] ].min,
      receiver_id: [ current_user.id, params[:receiver_id] ].max
    )

    # Create and send message
    message = conversation.messages.new(user: current_user, content: params[:message][:content])

    if message.save
      redirect_to conversation_path(conversation)
    else
      flash[:alert] = "Message cannot be empty"
      redirect_to conversation_path(conversation)
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
