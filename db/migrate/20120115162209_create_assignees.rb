class CreateAssignees < ActiveRecord::Migration
  def self.up
    create_table :assignees do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assignees
  end
end
