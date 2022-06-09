class CreateOpeningHours < ActiveRecord::Migration[6.1]
  def change
    create_table :opening_hours do |t|
      t.string :day
      t.string :hours
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
