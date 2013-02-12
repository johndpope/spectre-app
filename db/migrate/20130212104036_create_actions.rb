class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :desc
      t.integer :user_id

      t.timestamps
    end
    add_index :actions, [:user_id, :created_at]
  end
end
