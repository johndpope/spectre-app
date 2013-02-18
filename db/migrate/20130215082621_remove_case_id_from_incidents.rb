class RemoveCaseIdFromIncidents < ActiveRecord::Migration
  def up
    remove_column :incidents, :case_file_id
  end

  def down
    add_column :incidents, :case_file_id, :integer
  end
end
