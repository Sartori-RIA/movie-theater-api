class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.reference :room
      t.reference :movie
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :sections, :start_date
    add_index :sections, :end_date
    add_index :sections, :deleted_at
  end
end
