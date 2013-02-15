class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :incident_id
      t.integer :user_id
      t.boolean :open

      t.timestamps
    end
  end
end
