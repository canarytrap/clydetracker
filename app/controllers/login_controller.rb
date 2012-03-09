class LoginController < ApplicationController

  layout "welcome"

  def login
   if request.post?
     user = User.authenticate(params[:username], params[:password])
     if user
       session[:user_id] = user.id
       redirect_to(root_url)
     else
       flash.now[:notice] = "Invalid Username/Password combination"
     end
   end 
  end

  def logout
    session[:user_id] = nil
    redirect_to(:action => 'login')
  end
end
