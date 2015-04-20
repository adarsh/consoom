class UsersController < ApplicationController
#  skip_before_filter :authenticate_user!

  def index
    @all_users = User.all
    @all_friendships = Friendship.all

    @invite = Invite.new
  end

  def show
    @user = User.find(params[:id])
    @favorites = Activity.
      where(:user_id => @user.id, :source_type => "LineItem").
      order("updated_at DESC").
      page(params[:page]).per(25)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def welcome()
    #grab any invites for this user
    @user_invites = Invite.where(:invitee_email => current_user.email, :invitee_id => nil)
    @user_invites_count = @user_invites.count

    @user_invites.each do |invite|
      #make connection from each inviter to new user
      invite.inviter.add_connection(current_user.id)
      invite.update_attributes(:invitee_id => current_user.id)

      #notify each inviter that user has joined consoom
      UserMailer.invite_accepted_email(invite).deliver

    end
    @invite = Invite.new
  end

  def add_multiple_connections()
    params[:user].each do |user_pair|
      if user_pair[1] == "Yes"
        current_user.add_connection(user_pair[0])
      end
    end

    respond_to do |format|
      format.js { render action: "index"}
      format.html { redirect_to :action => "index" }
    end
  end
end
