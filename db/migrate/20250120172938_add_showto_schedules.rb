class AddShowtoSchedules < ActiveRecord::Migration[8.0]
  def change
    add_reference :schedules, :show, null: false, foreign_key: true
  end
end
