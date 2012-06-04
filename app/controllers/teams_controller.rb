class TeamsController < ApplicationController
 before_filter :require_user
  
  def new 
  end 

  # crate a new team 
  def create  
    puts params.inspect
    team = Team.create_team(params,current_user)
    render :json => {:err =>team["err"], :data => team[:data]} 
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

end
