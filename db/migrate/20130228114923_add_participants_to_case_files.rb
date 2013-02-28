class AddParticipantsToCaseFiles < ActiveRecord::Migration
  def change
    add_column :case_files, :participants, :string
  end
end
