class CreateMovieTheaterMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_theater_movies do |t|
      t.reference :movie_theater
      t.reference :movie

      t.timestamps
    end
  end
end
