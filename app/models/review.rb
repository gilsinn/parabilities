class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :comments
  has_many :review_ratings
end
