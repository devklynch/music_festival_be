class CreateShows < ActiveRecord::Migration[8.0]
  def change
    create_table :shows do |t|
      t.string :artist
      t.string :location
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
