class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.integer :court_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
    add_index :availabilities, :court_id
  end
end
