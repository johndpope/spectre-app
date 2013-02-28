class AddDefaultValueToOpenAttribute < ActiveRecord::Migration
  def up
      change_column :case_files, :open, :boolean, :default => true
  end

  def down
      change_column :case_files, :open, :boolean, :default => nil
  end
end
