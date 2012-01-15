class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.text :title
      t.text :description
      t.integer :author_id
      t.integer :points
      t.integer :status_id
      t.integer :assignee_id
      t.integer :story_type_id
      t.integer :section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
