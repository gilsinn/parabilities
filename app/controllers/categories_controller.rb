class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @users = User.all
    # @user = @users.find_by(params[:user_id])
    @user = current_user
  end

  def show
    @category = Category.find_by(name: params[:id])
    @facilities = @category.facilities
    @facility = @facilities.find_by(params[:reviews])
    @reviews = @facility.reviews
    @review = @reviews.find_by(params[:user_id])
    @user = current_user
<<<<<<< HEAD




=======
    @restaurants = @facilities.where(category_id: 1)
>>>>>>> 24de16992fca50f13b0327a5d8db4b938ccf51c4
  end

end
