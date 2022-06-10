class Facility < ApplicationRecord
  belongs_to :category
  has_many :opening_hours, dependent: :destroy
  has_many :facility_cuisines, dependent: :destroy
  has_many :reviews, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
