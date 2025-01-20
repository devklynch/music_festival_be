class CreateSchedulesShowsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules_shows, id: false do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
    end
  end
end

