class CreateMovieCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_categories do |t|
      t.reference :category
      t.reference :movie

      t.timestamps
    end
  end
end
