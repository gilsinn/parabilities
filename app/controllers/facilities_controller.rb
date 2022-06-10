class FacilitiesController < ApplicationController

  def new
    @facility = Facility.new
  end

  def create
  end

  def show
    @facility = Facility.find(params[:id])
  end
end
