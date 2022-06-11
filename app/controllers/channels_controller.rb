class ChannelsController < ApplicationController
  def community
    @channel = Channel.where(channel_id: 1)
    @message = Message.new
  end
end
