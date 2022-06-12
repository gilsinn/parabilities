class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
  end

  def create
  end

  def show
    @facility = Facility.find(params[:id])
    @review = Review.new
  end

  def search
    # @facility = Facility.seach(params[:name])
    @facilities = Facility.search_by_name(params[:name])
    @query = params[:name]
  end
end
