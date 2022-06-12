class ChannelsController < ApplicationController
  def community
    @channel = Channel.where(channel_id: 1)
    @messages = Message.all
  end
end
