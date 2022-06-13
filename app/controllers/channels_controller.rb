class ChannelsController < ApplicationController
  def community
    @channel = Channel.where(channel_id: 1)
    @messages = Message.all
    @users = User.all
    @reviews = Review.all
  end

  def show
    @channel = Channel.find(params[:id])
  end
end