class Facility < ApplicationRecord
  belongs_to :category
  has_many :opening_hours
  has_many :facilities_cuisines
  has_many :reviews
end
