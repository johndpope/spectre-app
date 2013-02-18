class AddCaseFileIdToActions < ActiveRecord::Migration
  def change
    add_column :actions, :case_file_id, :integer
  end
end
