class AddActiveToIncidentMonitors < ActiveRecord::Migration
  def change
    add_column :incident_monitors, :active, :boolean, default: false
  end
end
