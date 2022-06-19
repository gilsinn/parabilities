class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @users = User.all
    @user = current_user
  end

  def show
    @category = Category.find_by(name: params[:id])
    @facilities = @category.facilities

  end

end
