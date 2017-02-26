class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :checked
      t.integer :priority
      t.datetime :completed_at
      t.references :project, foreign_key: true, index: true

      t.timestamps
    end
  end
end
