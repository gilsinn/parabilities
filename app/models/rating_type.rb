class RatingType < ApplicationRecord
  has_many :review_ratings
  has_many :rating_type_categories
end
