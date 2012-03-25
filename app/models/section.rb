# this is a sprint
class Section < ActiveRecord::Base
  has_many :stories

  before_update :valid_start_date, :valid_duration

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

  # we dont want to display 'icebox' or 'backlogs'
  def self.past_sprints
    results = find(:all, :conditions => "id NOT IN (1, 2) AND end_date < curdate()", 
                    :order => "end_date desc")
  end

private
  def valid_duration
    current_sprint_start  = DateTime.strptime(self.start_date.to_s, "%Y-%m-%d")
    current_sprint_end    = DateTime.strptime(self.end_date.to_s, "%Y-%m-%d")

    if current_sprint_end < (current_sprint_start + 5)
      errors.add(:message, "Sprint must be at least 5 days long")
      return false
    end
    return true
  end

  def valid_start_date
    current_sprint_start  = DateTime.strptime(self.start_date.to_s, "%Y-%m-%d")
    last_sprint_end       = DateTime.strptime(Section::previous_sprint.end_date.to_s, "%Y-%m-%d")

    if current_sprint_start <= last_sprint_end
      errors.add(:message, "Start Date cannot overlap with the previous sprint")
      return false
    end
  end
end
