class CreateFacilityCuisines < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_cuisines do |t|
      t.references :facility, null: false, foreign_key: true
      t.references :cuisine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
