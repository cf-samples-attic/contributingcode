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

 
  # User joins existing teams 
  # 
  def join
    team = Team.join(current_user,params[:id]) 
    render :json => {:err =>team["err"], :data => team[:data]} 
  end 


  # A non owner leaves team and an email is sent to notify the owner
  def leave
    team = Team.leave_team(current_user)
    render :json => {:err => team[:err], :data => team[:data]} and return  
  end 

  # Owner of a team accepts the join request 
  # All other join requests are deleted 
  # An email is sent to the requester 
  def accept
    team = Team.accept(params,current_user)
    render :json => {:err => team[:err], :data => team[:data]} and return 
  end


  # User request is decline by team owner 
  # That particular join request record is deleted 
  # Requestor is notified via email 
  def decline
   team = Team.decline(params, current_user)
   render :json => {:err => team[:err], :data => team[:data]} and return 
  end 

  # Remove a memeber from a team 
  # Can be doen only by the owner 
  # Notify via email 
  def remove_member
    team = Team.remove_member(params, current_user)
    render :json => {:err => team[:err], :data => [:data]} and return 
  end 

  # Delete whole team 
  # Inform all members via email 
  def destroy
    team = Team.delete_team(params, current_user)
    render :json => {:err => team[:err], :data => [:data]} and return 
  end 
  
  # Add request  
  # Send email to member and wait for conf 
  def add_request
    team = current_user.owned_team
    render :json => {:err => "present", :data => nil} if team.blank?
    request = AddRequest.new
    request.team_id = team.id
    request.user_id = params[:id]
    request.team_name = team.name
      if request.save
        #Resque.enqueue(RequestMailer,current_user.name,team.name,user.email,0)
        render :json => {:err => nil, :data => request}
      else  
        render :json => {:err => "present", :data => request.errors.full_messages.to_s}
      end 
  end 

end

