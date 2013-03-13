class AddSymbolToCaseFile < ActiveRecord::Migration
  def change
    add_column :case_files, :symbol, :string
    add_index :case_files, :symbol
  end
end
