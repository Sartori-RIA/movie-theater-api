class CreateMovieTheaters < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_theaters do |t|
      t.string :name
      t.datetime :deleted_at
      t.string :picture
      t.string :banner

      t.timestamps
    end
    add_index :movie_theaters, :deleted_at
  end
end
