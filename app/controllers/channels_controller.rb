class ChannelsController < ApplicationController
  def community
    # @channel = Channel.find(params[:id])
    # @channel = Channel.where(channel_id: 1)

    @channel = Channel.find_by_name("Community")
    @messages = Message.all
    @message = Message.new
    @users = User.all
    @reviews = Review.all
    @user = @users.find_by(params[:user_id])
    raise

    @combined_content = @reviews + @messages
    @combined_content = @combined_content.sort_by {|content| content.created_at}
  end
end
