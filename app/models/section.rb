class Section < ActiveRecord::Base

  # create a default current sprint if none exists
  def self.create_current_sprint
    if !self.current_sprint
      section = self.new(:name        => "current",
                        :description  => "default current sprint",
                        :start_date   => Time.now,
                        :end_date     => Time.now + (60*60*24*7))
      section.save!
    end
  end

  def self.current_sprint
    results = find(:all, :conditions => "end_date >= curdate()", 
                    :order => "end_date asc", 
                    :limit => 1)
    results.first
  end

  def self.previous_sprint
    results = find(:all, :conditions => "end_date < curdate()", 
                    :order => "end_date desc", 
                    :limit => 1)
    results.first                
  end

  def self.select_box
    # TODO: clean this up
    sections = [{'id' => 1, 'name' => 'Icebox'},
                {'id' => 2, 'name' => 'Backlog'},
                {'id' => self.current_sprint.id, 'name' => self.current_sprint.name}]
  end
end