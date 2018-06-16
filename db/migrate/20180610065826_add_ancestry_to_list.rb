class AddAncestryToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :ancestry, :string
    add_index :lists, :ancestry
  end
end
