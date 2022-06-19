class ChannelsController < ApplicationController
  def community
    # @channel = Channel.find(params[:id])
    # @channel = Channel.where(channel_id: 1)

    @channel = Channel.find_by_name("Community")
    @messages = Message.all
    @post = @messages.find_by(params[:user_id])
    @message = Message.new
    @user = @post.user
    @reviews = Review.all
    @facilities = Facility.all
    @facility = @facilities.find_by(params[:category_id])

    @combined_content = @reviews + @messages
    @combined_content = @combined_content.sort_by {|content| content.created_at}
  end
end
