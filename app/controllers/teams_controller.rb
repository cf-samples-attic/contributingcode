class TeamsController < ApplicationController
 before_filter :require_user
  
  def new 
  end 

  # crate a new team 
  def create  
    team = Team.new
    team.name = params[:name] 
    team.desc = params[:desc]
    team.owner_id = current_user.id
    team.owner_handle = current_user.handle
    team.member_count = 1
    # check for validations before save
    if team.save
      # Create a team memeber 
      member = TeamMember.new(:team_id => team.id, :user_id => team.owner_id, :user_handle => team.owner_handle)
      member.save
      render :json => {:err => nil, :data => team} 
    else
      render :json => {:err => "present", :data => team.errors.full_messages.to_s} 
    end 
  end 
 
  # fetch all teams 
  def index 
    @teams = Team.all
  end 

  def update 
  end 

  # Delete whole team 
  # Inform all members via email 
  def destroy
    team = current_user.owned_team
    render :json => {:err => nil, :data => nil} if team.blank?
    team_members = team.team_members
    # collect all users in team 
    users = User.where(:id => team_members.collect(&:user_id)).index_by(&:id)
    # Send email to each memeber
    team_members.each do |member|
      # send email to all except owner
      Resque.enqueue(DecideTeamMailer, current_user.name, team.name, users[member.user_id].email, 4) if member.user_id != current_user.id
    end
    team.destroy
    render :json => {:err => nil, :data => nil}
  end 
  
  # Add request  
  # Send email to member and wait for conf 
  def add_request
    team = current_user.owned_team
    render :json => {:err => "present", :data => nil} if team.blank?
    render :json => {:err => "present", :data => nil} if team.blank?
    request = team.add_requests.build :user_id =>params[:id] 
      if request.save
        #Resque.enqueue(RequestMailer,current_user.name,team.name,user.email,0)
        render :json => {:err => nil, :data => request}
      else  
        render :json => {:err => "present", :data => request.errors.full_messages.to_s}
      end 
  end 

end

