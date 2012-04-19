class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :story_id
      t.string :title
      t.text :description
      t.integer :author_id
      t.string :hours
      t.integer :status_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
