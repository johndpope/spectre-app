class AddContentToActions < ActiveRecord::Migration
  def change
    add_column :actions, :content, :text
  end
end
