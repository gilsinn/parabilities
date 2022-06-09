class Facility < ApplicationRecord
  belongs_to :category
  has_many :opening_hours, dependent: :destroy
  has_many :facility_cuisines, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
