class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name, limit: 150
      t.text :description

      t.timestamps
    end
  end
end
