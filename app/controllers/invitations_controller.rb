class InvitationsController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /invitations
  # GET /invitations.xml
  def index
    @invitations = Invitation.all
    respond_with(@invitations)
  end

  # GET /invitations/1
  # GET /invitations/1.xml
  def show
    @invitation = Invitation.find(params[:id])
    respond_with(@invitation)
  end

  # GET /invitations/new
  # GET /invitations/new.xml
  def new
    @invitation = Invitation.new
    respond_with(@invitation)
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.xml
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.user = @user
    @invitation.initialize_code
    @invitation.save
    Notifier.invitation_notification(@invitation).deliver
    respond_with(@invitation)
  end

  # PUT /invitations/1
  # PUT /invitations/1.xml
  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update_attributes(params[:invitation])
    respond_with(@invitation)
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.xml
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    respond_with(@invitation)
  end
end
