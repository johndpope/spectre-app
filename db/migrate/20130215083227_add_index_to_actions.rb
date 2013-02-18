class AddIndexToActions < ActiveRecord::Migration
  def change
    add_index :actions, :case_file_id
  end
end
