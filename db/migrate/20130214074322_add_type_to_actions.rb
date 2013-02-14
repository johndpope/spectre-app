class AddTypeToActions < ActiveRecord::Migration
  def change
    add_column :actions, :type, :string, null: false
    add_index :actions, :type
  end
end
