class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
      t.timestamps
    end
  end
end
