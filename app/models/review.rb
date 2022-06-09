class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :comments, dependent: :destroy
  has_many :review_ratings, dependent: :destroy
end
