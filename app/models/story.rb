class Story < ActiveRecord::Base
  has_many :assignees
end
