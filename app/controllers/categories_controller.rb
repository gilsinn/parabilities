class CategoriesController < ApplicationController
<<<<<<< HEAD
  def show
    @category = Category.find(params[:id])
=======

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:id])
    @facilities = @category.facilities
>>>>>>> 352778225ee44030a9562b99723b0e451ad1e16e
  end
end
