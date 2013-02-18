class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :type
      t.integer :case_file_id

      t.timestamps
    end
  end
end
