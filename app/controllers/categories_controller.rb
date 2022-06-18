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

    @facility = @category.facilities.find_by(params[:facility_id])

    @reviews = @facility.reviews

    sum = 0
    count = 0

    @reviews.each do |review|
      @review.review_ratings.each do |review_rating|
        sum += review_rating.rating
        count += 1
      end
    end

    @average_rating = count != 0 ? sum.fdiv(count).round : 0
  end

end
