class CreateRatingTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :rating_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
