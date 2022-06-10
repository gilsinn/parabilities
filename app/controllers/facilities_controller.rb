class FacilitiesController < ApplicationController
  include PgSearch::Model
  multisearchable against: [:name]
end

  def new
    @facility = Facility.new
  end

  def create
  end

  def show
    @facility = Facility.find(params[:id])
  end
