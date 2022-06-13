class ReviewsController < ApplicationController

  def new
    @facility = Facility.find(params[:facility_id])
    @review = Review.new(user_id: current_user.id, facility_id: @facility.id)
    @rating_types = RatingType.all
  end

  def create
    @facility = Facility.find(params[:facility_id])
    @review = Review.new(review_params)
    @review.facility = @facility
    if @review.save
      redirect_to facility_path(@facility)
    else
      render :new
    end

  end

  def show
    @review = Review.find(params[:id])
    @facility = Facility.find(@review.facility_id)
    @user = User.find(@review.user_id)
    @rating_types = RatingType.all
  end

  private

  def review_params
    params.require(:review).permit(:content, :image)
  end
end
