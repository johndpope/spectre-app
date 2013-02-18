class AddDetectionTimeToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :detection_time, :datetime
    add_index :incidents, :detection_time
  end
end
