class CommunityChannel < ApplicationCable::Channel
  def subscribed
    community = Channel.find(params[:id])
    stream_for community
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
