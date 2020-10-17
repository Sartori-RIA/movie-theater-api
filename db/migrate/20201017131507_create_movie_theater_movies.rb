class CreateMovieTheaterMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_theater_movies do |t|
      t.references :movie_theater, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
