class CategoriesController < ApplicationController
  def index
    @categories = Category.all

  end

  def show
    @category = Category.find_by(name: params[:id])
    @facilities = @category.facilities
    if @category.name == "Restaurants"
      @cuisines = Cuisine.all
    end
  end

end
