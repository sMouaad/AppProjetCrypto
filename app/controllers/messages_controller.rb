class MessagesController < ApplicationController
  before_action :authenticate_user!
  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end


  # POST /messages or /messages.json
  def create
    @message = current_user.messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.turbo_stream
        format.html { redirect_to messages_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def message_params
      params.expect(message: [ :content ])
    end
end
