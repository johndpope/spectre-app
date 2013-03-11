class AddNameToCaseFiles < ActiveRecord::Migration
  def change
    add_column :case_files, :name, :string
  end
end
