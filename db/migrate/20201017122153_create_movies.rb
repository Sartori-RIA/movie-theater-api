class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :summary
      t.integer :age_classification
      t.string :banner
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :movies, :title
    add_index :movies, :deleted_at
  end
end
