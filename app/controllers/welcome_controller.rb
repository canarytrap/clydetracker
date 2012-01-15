class WelcomeController < ApplicationController
  def index
    @stories = Story.find :all, :order => "id DESC"
    
    @users = User.find :all, :order => "name"
  end
end
