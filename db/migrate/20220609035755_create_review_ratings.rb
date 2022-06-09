class CreateReviewRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :review_ratings do |t|
      t.integer :rating
      t.references :rating_type, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
