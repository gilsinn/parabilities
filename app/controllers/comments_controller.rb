class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comments.new(comment_params)
    @comment.review = @review

    if current_user
      @comment.save
      redirect_to facility_path(@review.facility_id)
    else
      redirect_to user_session_path, alerts: "You must be logged in to add a comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
