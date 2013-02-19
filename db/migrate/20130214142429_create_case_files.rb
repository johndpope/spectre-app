class CreateCaseFiles < ActiveRecord::Migration
  def change
    create_table :case_files do |t|
      t.integer :user_id
      t.boolean :open

      t.timestamps
    end
  end
end
