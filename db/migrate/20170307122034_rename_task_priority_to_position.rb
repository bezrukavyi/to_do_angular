class RenameTaskPriorityToPosition < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :tasks, :priority, :position
  end

  def self.down
    rename_column :tasks, :position, :priority
  end
end
