class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :type
      t.integer :case_id

      t.timestamps
    end
  end
end
