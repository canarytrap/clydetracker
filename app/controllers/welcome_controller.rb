class WelcomeController < ApplicationController
  def index
    # if it doesnt exist lets create a default one
    Section.create_current_sprint

    # stories for each section
    @stories_icebox   = Story.find_all_by_section_id(1, :order => "priority ASC")
    @stories_backlog  = Story.find_all_by_section_id(2, :order => "priority ASC")
    @current_sprint   = Section.current_sprint
    @stories_current  = Story.find_all_by_section_id(@current_sprint, :order => "priority ASC")

    @previous_sprint  = Section.previous_sprint
    @stories_previous = Story.find_all_by_section_id(@previous_sprint, :order => "priority ASC")

    # for select boxes
    @users            = User.find :all, :order => "name"
    @statuses         = Status.find :all, :order => "id ASC"
    @story_types      = StoryType.find :all, :order => "name ASC"
    @sections         = Section.select_box
  end
end
