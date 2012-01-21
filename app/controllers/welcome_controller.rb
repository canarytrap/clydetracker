class WelcomeController < ApplicationController
  def index
    @stories_icebox   = Story.find_all_by_section_id(1, :order => "id DESC")
    @stories_backlog  = Story.find_all_by_section_id(2, :order => "id DESC")
    @stories_current  = Story.find_all_by_section_id(3, :order => "id DESC")

    @users            = User.find :all, :order => "name"
    @statuses         = Status.find :all, :order => "id ASC"
    @story_types      = StoryType.find :all, :order => "name ASC"
    @sections         = Section.find :all, :order => "name ASC"
  end
end
