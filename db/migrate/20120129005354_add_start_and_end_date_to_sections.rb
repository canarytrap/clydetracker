class AddStartAndEndDateToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :start_date, :datetime
    add_column :sections, :end_date, :datetime
  end

  def self.down
    remove_column :sections, :start_date
    remove_column :sections, :end_date
  end
end
