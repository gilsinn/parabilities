class ReviewsController < ApplicationController
  def new

  end

  def create
    @facility = Facility.find(params[:facility_id])
    @review = Review.new(review_params)
    @review.facility = @facility
    if @review.save
      redirect_to facility_path(@facility)
    else
      render "facilities/show"
    end

  end

  def show

  end

  private

  def review_params
    params.require(:review).permit(:content)
end
