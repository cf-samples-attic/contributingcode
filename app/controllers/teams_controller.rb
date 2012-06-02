class TeamsController < ApplicationController
 before_filter :require_user
  
  def new 
  end 

  def create  
    team = Team.create_team(params,current_user)
    if team[:err].present?
      render :json => {:err => "e1", :data=> team[:data]} 
    else 
      render :json => {:err => nil, :data=> team[:data]} 
    end 
  end 

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
     if team[:err].present?
      render :json => {:err => "e1", :data=> team[:data]} 
    else 
      render :json => {:err => nil, :data=> team[:data]} 
    end
  end 


  def accept
    render :json => { :err=>"e1", :data => "Invalid request!" } if params[:id].blank?
    team = Team.where(:owner_id => current_user.id).first
    # check if team exists
    render :json => {:err =>"e1", :data => "No such team"} if team.blank?
    # check team capacity 
    render :json => {:err =>"e1", :data => "No such team"} if team.member_count > 4
    # Query for member  
    join_request = JoinRequest.where(:user_id=>params[:id], :team_id =>team.id).first
    # Check if member request exists 
    render :json => {:err =>"e2", :data => "No such request"} if join_request.blank?
    # add to team member table 
    team_member = TeamMember.new(:user_id => join_request.user_id, :team_id => join_request.team_id, :user_handle=> join_request.user_handle)
    team_member.save 
    team.member_count = team.member_count + 1
    team.save
    member = User.find(params[:id])
    member.join_requests.destroy
    # Email member 
    Resque.enqueue(DecideTeamMailer, current_user.name, team.name, member.email, 1)
    render :json => {:err =>nil, :data => nil} 
  end

  def decline
    render :json => { :err=>"e1", :data => "Invalid request!" } if params[:id].blank?
    team = Team.where(:owner_id => current_user.id).first
    render :json => {:err =>"e1", :data => "No such team"} if team.blank?
    team_member = TeamMember.where(:user_id=>params[:id], :team_id =>team.id, :status => false).first
    render :json => {:err =>"e2", :data => "No such request"} if team_member.blank?
    member = User.find(team_member.user_id)
    team_member.delete
    Resque.enqueue(DecideTeamMailer, current_user.name, team.name, member.email, 0) if member.user_id != current_user.id
    render :json => {:err =>nil, :data => nil} 
  end 

  def remove_member
    render :json => { :err=>"e1", :data => "Invalid request!" } if params[:id].blank?
    team = Team.where(:owner_id => current_user.id).first
    render :json => {:err =>"e2", :data => "No such team"} if team.blank?
    team_member = TeamMember.where(:user_id=>params[:id], :team_id =>team.id, :status => true).first
    render :json => {:err =>"e3", :data => "No such request"} if team_member.blank?
    member = User.find(team_member.user_id)
    team_member.delete
    team.member_count = team.member_count - 1 
    Resque.enqueue(DecideTeamMailer, current_user.name, team.name, member.email, 3) 
    render :json => {:err =>nil, :data => nil} 
  end 


  def destroy
    team = Team.where(:owner_id => current_user.id).first
    render :json => {:err =>"e1", :data => "No such team"} if team.blank?
    team_members = team.team_members
    puts team_members.inspect
    team_members.each do |member|
      to_email = User.find(member.user_id).email
      # send email to all except owner
      Resque.enqueue(DecideTeamMailer, current_user.name, team.name, to_email, 4) if member.user_id != current_user.id
    end
    team.destroy
    render :json => {:err =>nil, :data => "Deleted!"} 
  end 

end
