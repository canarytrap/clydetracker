class Story < ActiveRecord::Base
  belongs_to :section
  has_many :assignees
  
  # TODO: sql injection validation
  def self.search search_string
    results = find(:all, 
                    :conditions => "title LIKE '%#{search_string}%' 
                                    OR description LIKE '%#{search_string}'", 
                    :order => "created_at asc")
  end
end