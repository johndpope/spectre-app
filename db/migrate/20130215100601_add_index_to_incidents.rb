class AddIndexToIncidents < ActiveRecord::Migration
  def change
    add_index :incidents, :created_at
  end
end
