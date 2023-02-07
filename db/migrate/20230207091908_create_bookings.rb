class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :court_id
      t.datetime :start_time
      t.datetime :end_time
      t.text :notes

      t.timestamps
    end
    add_index :bookings, :court_id
  end
end
