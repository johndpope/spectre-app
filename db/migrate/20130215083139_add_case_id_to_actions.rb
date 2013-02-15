class AddCaseIdToActions < ActiveRecord::Migration
  def change
    add_column :actions, :case_id, :integer
  end
end
