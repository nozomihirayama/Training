class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, limit: 20, null: false
      t.text :content, limit: 200, null: false
      t.datetime :deadline, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
