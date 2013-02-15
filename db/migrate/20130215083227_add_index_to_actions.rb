class AddIndexToActions < ActiveRecord::Migration
  def change
    add_index :actions, :case_id
  end
end
