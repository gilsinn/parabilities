class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @restaurants = Category.find_by(name: params[:id])
    @restaurants = Category.find(1)

  end

  def show
    @category = Category.find_by(name: params[:id])
    @facilities = @category.facilities
  end

end
