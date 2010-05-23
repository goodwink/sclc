class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  before_filter :authenticate
  before_filter :password_protected if Rails.env.production?
  
  def password_protected
    authenticate_or_request_with_http_basic do |username, password|
      username == "private-staging" && password == "tH1$!s$e3kr1+"
    end
  end
  
  def authenticate
    @user = User.find_by_id(session[:user_id])
    
    redirect_to login_url, :alert => "Please log in" unless @user
  end
end
