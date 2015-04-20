class InvitesController < ApplicationController
  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invites }
    end
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
    @invite = Invite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/new
  # GET /invites/new.json
  def new
    @invite = Invite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find(params[:id])
  end

  # POST /invites
  # POST /invites.json
  def create

    @invite = Invite.new(params[:invite])
    @invite.inviter_id = current_user.id

    #check to see if invitee in the system
    invitee = User.find_by_email(@invite.invitee_email)

    if !invitee.nil?
      #if existing user, add a connection request
      Friendship.request(current_user, invitee)
    else
      #send email to invitee here
      UserMailer.invite_email(@invite).deliver
    end


    respond_to do |format|
      if @invite.save
        format.html { redirect_to users_index_path,
          notice: "Invite sent to #{@invite.invitee_email}" }
        format.json { render json: @invite, status: :created, location: @invite }
      else
        format.html { render action: "new" }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invites/1
  # PUT /invites/1.json
  def update
    @invite = Invite.find(params[:id])

    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to invites_url }
      format.json { head :ok }
    end
  end
end
