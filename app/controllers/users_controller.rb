class UsersController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create]
  respond_to :html, :xml, :json
  
  # GET /users
  # GET /users.xml
  def index
    respond_with(@users = User.all)
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    respond_with(@user = User.find(params[:id]))
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    respond_with(@user = User.new)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    if verify_recaptcha(:model => @user) && @user.save
      session[:user_id] = @user.id
      respond_with(@user, :status => :created)
    else
      respond_with(@user.errors, :status => :unprocessable_entity)
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      respond_with(@user, :head => :ok)
    else
      respond_with(@user.errors, :status => :unprocessable_entity)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    respond_with(@user, :location => users_url, :head => :ok)
  end
end
