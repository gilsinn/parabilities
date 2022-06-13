class Facility < ApplicationRecord
  belongs_to :category
  belongs_to :opening_hour
  has_many :rating_type_categories, through: :category
  has_many :rating_types, through: :rating_type_categories
  has_many :facility_cuisines, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews


  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
    tsearch: { prefix: true }
    }
end
