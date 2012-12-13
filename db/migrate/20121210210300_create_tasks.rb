class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :duedate
      t.boolean :completed
      t.integer :user_id
      t.integer :id

      t.timestamps
    end
  end
end
