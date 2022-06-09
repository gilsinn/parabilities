class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :price_range
      t.string :verified_status
      t.boolean :verified_status
      t.date :verified_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
