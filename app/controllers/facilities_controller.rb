class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    @user = User.find(params[:user_id])
    @facility.user = @user
    if @facility.save
     redirect_to facility_path(@user, @facility)
    else
      render :new
    end
  end

  def show
    @facility = Facility.find(params[:id])
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def search
    # @facility = Facility.seach(params[:name])
    @facilities = Facility.search_by_name(params[:name])
    @query = params[:name]
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :address, :content, :image)
  end

end
