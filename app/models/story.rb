class Story < ActiveRecord::Base
  belongs_to :section
  has_many :assignees
end
