class Story < ActiveRecord::Base
  belongs_to :section
  has_many :assignees

  validates_presence_of :title

  before_create :add_to_icebox

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
    self.author_id  = 1
    self.section_id = 1
  end
end
