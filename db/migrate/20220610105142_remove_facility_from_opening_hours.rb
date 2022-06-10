class RemoveFacilityFromOpeningHours < ActiveRecord::Migration[6.1]
  def change
    remove_reference :opening_hours, :facility, null: false, foreign_key: true
  end
end
