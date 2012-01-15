class WelcomeController < ApplicationController
  def index
    @stories  = Story.find :all, :order => "id DESC"
    @users    = User.find :all, :order => "name"
    @statuses = Status.find :all, :order => "id ASC"
  end
end
