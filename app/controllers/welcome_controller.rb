class WelcomeController < ApplicationController
  def index
    # TODO: move to view helper
    @stories      = Story.find :all, :order => "id DESC"
    @users        = User.find :all, :order => "name"
    @statuses     = Status.find :all, :order => "id ASC"
    @story_types  = StoryType.find :all, :order => "name ASC"
  end
end
