class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]

  def create
    @channel = Channel.find(params[:channel_id])
    @message = Message.new(message_params)
    @message.channel = @channel
    @message.user = current_user
    if @message.save
      CommunityChannel.broadcast_to(
        @channel,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render "channels/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
