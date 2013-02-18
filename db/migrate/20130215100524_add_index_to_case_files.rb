class AddIndexToCaseFiles < ActiveRecord::Migration
  def change
    add_index :case_files, [:user_id, :incident_id, :created_at]
  end
end
