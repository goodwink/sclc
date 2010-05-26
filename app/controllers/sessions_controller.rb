class SessionsController < ApplicationController
  skip_before_filter :authenticate
  
  def new
  end

  def create
    if user = User.authenticate(params[:login_name], params[:password])
      session[:user_id] = user.id
      redirect_to users_url, :notice => "Successfully logged in"
    else
      redirect_to login_url, :alert => "Invalid user name/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end

end