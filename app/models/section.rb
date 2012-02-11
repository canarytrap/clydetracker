class Section < ActiveRecord::Base
  
  def self.current_sprint
    find(:all, :conditions => "end_date >= curdate()", 
          :order => "end_date asc", 
          :limit => 1)
  end
  
  def self.previous_sprint
    find(:all, :conditions => "end_date < curdate()", 
          :order => "end_date desc", 
          :limit => 1)
  end

  # icebox and backlogs
  SELECT_BOX_SPRINTS = [{'id' => 1, 'name' => 'Icebox'},
                        {'id' => 2, 'name' => 'Backlog'},
                        {'id' => self.current_sprint.first.id, 'name' => 'Current'}]
end