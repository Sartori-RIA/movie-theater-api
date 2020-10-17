class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.datetime :deleted_at
      t.reference :movie_theater

      t.timestamps
    end
    add_index :rooms, :deleted_at
    add_index :rooms, :movie_theater
  end
end
