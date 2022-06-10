class AddDistanceToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_column :facilities, :distance, :integer
  end
end
