class Story < ActiveRecord::Base
  belongs_to :section
  has_many :assignees
  has_many :tasks

  validates_presence_of :title

  before_create :add_to_icebox, :detect_story_type

# TODO: sql injection validation
  def self.search search_string
    results = find(:all, 
                    :conditions => "title LIKE '%#{search_string}%' 
                                    OR description LIKE '%#{search_string}'", 
                    :order => "created_at asc")
  end

private
  # when creating a new story, set default values here
  def add_to_icebox
    self.section_id = 1
  end

  # parse first word for story type
  def detect_story_type
    if self.title.index("bug") == 0
      self.story_type_id = 3
      self.title = self.title[3, self.title.length]
    elsif self.title.index("tech") == 0
      self.story_type_id = 2
      self.title = self.title[4, self.title.length]
    else
      self.story_type_id = 1
    end
  end
end
