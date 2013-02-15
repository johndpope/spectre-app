class AddIndexToCases < ActiveRecord::Migration
  def change
    add_index :cases, [:user_id, :incident_id, :created_at]
  end
end
