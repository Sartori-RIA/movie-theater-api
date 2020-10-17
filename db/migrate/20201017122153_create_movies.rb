class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :summary
      t.integer :age_classification
      t.string :banner

      t.timestamps
    end
    add_index :movies, :title
  end
end
