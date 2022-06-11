class RenameOpeningHoursColumnNameToFacilities < ActiveRecord::Migration[6.1]
  def change
    rename_column :facilities, :opening_hours_id, :opening_hour_id
  end
end
