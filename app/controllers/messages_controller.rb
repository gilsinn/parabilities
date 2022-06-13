class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]

  def create
    @channel = Channel.find(params[:channel_id])
    @message = Message.new(message_params)
    @message.channel = @channel
    @message.user = current_user
    if @message.save
      redirect_to community_path(anchor: "message-#{@message.id}")
    else
      render "channels/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
