class AddIncidentMonitorIdToActions < ActiveRecord::Migration
  def change
    add_column :actions, :incident_monitor_id, :integer
    add_index :actions, :incident_monitor_id
  end
end
