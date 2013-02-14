class AddContentToActions < ActiveRecord::Migration
  def change
    add_column :actions, :content, :string
  end
end
