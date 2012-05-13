class Task < ActiveRecord::Base
  belongs_to :story

  # tasks marked as done should have status id set accordingly
  #
  # @param integer id
  # @param array completed_tasks array of completed tasks
  # @return integer
  def self.set_status_done id, completed_tasks
    if completed_tasks.has_key?(id)
      return 8
    end
    return 1
  end
end
