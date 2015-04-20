class AddStatusToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :status, :boolean
  end
end
