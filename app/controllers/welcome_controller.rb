class WelcomeController < ApplicationController
  def index
    @stories = Story.find :all, :order => "id DESC"
  end
end
