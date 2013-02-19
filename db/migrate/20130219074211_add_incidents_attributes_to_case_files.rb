class AddIncidentsAttributesToCaseFiles < ActiveRecord::Migration
  def change
    add_column :case_files, :type, :string
    add_column :case_files, :content, :text
    add_column :case_files, :detection_time, :datetime
    add_index :case_files, :type
  end
end
