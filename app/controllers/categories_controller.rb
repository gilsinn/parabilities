class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:id])
    @facilities = @category.facilities
    @restaurants = @facilities.where(category_id: 1)
  end

end
