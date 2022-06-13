class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
    # @category = Category.find(params[:category_id])
  end

  def create
    @facility = Facility.new(facility_params)
    # @category = Category.find(params[:category_id])
    @facility.category = @category
    if @facility.save
     redirect_to facility_path(@category, @facility)
     puts "Thank You. Your Request Has Been Submitted."
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
    params.require(:facility).permit(:name, :address, :phone, :category_id, :image)
  end

end
