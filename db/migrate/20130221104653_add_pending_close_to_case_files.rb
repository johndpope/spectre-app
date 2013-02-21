class AddPendingCloseToCaseFiles < ActiveRecord::Migration
  def change
    add_column :case_files, :pending_close, :boolean, default: false
    add_index :case_files, [:open, :pending_close]
  end
end
