class Category < ApplicationRecord
  has_many :facilities
  has_many :rating_type_categories
end
