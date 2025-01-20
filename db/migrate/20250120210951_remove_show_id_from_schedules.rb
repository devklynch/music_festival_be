class RemoveShowIdFromSchedules < ActiveRecord::Migration[8.0]
  def change
      remove_column :schedules, :show_id, :bigint
  end
end

