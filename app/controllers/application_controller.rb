# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  #layout "welcome"   this is not working for some reason
  #
  before_filter :authorize, :except => [:login]

protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = 'Please Log In'
      redirect_to(:action => 'login', :controller => 'login')
    end
  end
end
