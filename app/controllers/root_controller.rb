class RootController < ApplicationController
  skip_before_filter :authenticate
  
  def index
    @user = User.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end