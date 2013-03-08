class CreateIncidentMonitors < ActiveRecord::Migration
  def change
    create_table :incident_monitors do |t|
      t.string :type
      t.text :desc
      t.text :settings

      t.timestamps
    end
  end
end
