class AddContentToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :content, :text
  end
end
