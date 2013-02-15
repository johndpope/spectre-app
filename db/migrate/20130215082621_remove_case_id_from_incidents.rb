class RemoveCaseIdFromIncidents < ActiveRecord::Migration
  def up
    remove_column :incidents, :case_id
  end

  def down
    add_column :incidents, :case_id, :integer
  end
end
