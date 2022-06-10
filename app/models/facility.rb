class Facility < ApplicationRecord
  belongs_to :category
  belongs_to :opening_hour
  has_many :facility_cuisines, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
