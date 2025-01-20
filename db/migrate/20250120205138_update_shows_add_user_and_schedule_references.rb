class UpdateShowsAddUserAndScheduleReferences < ActiveRecord::Migration[8.0]
  def change
    remove_column :schedules, :show_id, :bigint
    
    add_reference :shows, :schedule, null: true, foreign_key: true
    add_reference :shows, :user, null: false, foreign_key: true
  end
end
