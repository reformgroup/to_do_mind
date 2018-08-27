class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, limit: 150
      t.text :description
      # t.integer :status
      # t.datetime :start
      # t.datetime :end
      # t.datetime :deadline
      # t.references :author
      # t.references :assignee
      # t.references :followers
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
