class ChannelsController < ApplicationController
  def community
    @channel_name = Channel.name
  end
end
