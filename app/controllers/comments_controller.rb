class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.review = @review
    if current_user
      @comment.save
      redirect_to facility_path(@review.facility_id, anchor: "comment-#{@comment.id}")
    else
      redirect_to user_session_path, alerts: "You must be logged in to add a comment"
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
