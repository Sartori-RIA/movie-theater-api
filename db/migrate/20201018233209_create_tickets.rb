class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :session, null: false, foreign_key: true
      t.integer :seat
      t.boolean :half
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :tickets, :deleted_at
  end
end
