class Team < ActiveRecord::Base
  belongs_to :user 

  has_many :team_members, :dependent => :destroy
  has_many :join_requests, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_uniqueness_of :owner_id, :message => "Cant own many teams"
  validate :user_not_in_a_team

  def user_not_in_a_team
    user = User.find(owner_id)
    team = user.team
    puts team.inspect
    if team.present?
     errors.add(:owner_id,"Already in a team")
    end   
 end


  class << self 


    # Join team 
    # 
    def join(current_user,team_id)
      # check if the user is already in a team 
      member = current_user.team_member
      return {:err => "e1", :data => "You are already in a team !"} if member.present?
      # Get the team record  
      team = Team.find(team_id)
      # check if there exists a team with the id in params
      return {:err => "e2", :data => "No such team !"} if team.blank?
      # Check for team size
      return {:err => "e3", :data => "Team has already has four members !"} if team.member_count == 4
      # Add to team members 
      join_request = JoinRequest.new(:team_id => team_id, :user_id => current_user.id, :user_handle => current_user.handle)
      # save teammember 
      join_request.save
      # Query owner user object 
      owner = User.find(team.owner_id)
      # Now send an accept email to owner 
      Resque.enqueue(RequestMailer, current_user.name, team.name, owner.email, 1)
      return {:err => nil, :data => join_request}
    end

    # owner accepts the request 
    def accept(params, current_user) 
      return { :err=>"e1", :data => "Invalid request!" } if params[:id].blank?
      # Fetch to check if owner 
      team = current_user.owned_team
      # check if team exists
      return {:err =>"e1", :data => "No such team"} if team.blank?
      # check team capacity 
      return {:err =>"e1", :data => "Team already has 4 members !"} if team.member_count >= 4
      # Query for member  
      join_request = JoinRequest.where(:user_id=>params[:id], :team_id =>team.id).first
      # Check if member request exists 
      return  {:err =>"e2", :data => "No such request"}  if join_request.blank?
      # add to team member table 
      team_member = TeamMember.new(:user_id => join_request.user_id, :team_id => join_request.team_id, :user_handle=> join_request.user_handle)
      # save team member 
      team_member.save 
      # Increment team count 
      team.member_count = team.member_count + 1
      # save team 
      team.save
      # Find member to send email 
      member = User.find(params[:id])
      # delete all join requests 
      member.join_requests.destroy_all
      # Email member 
      Resque.enqueue(DecideTeamMailer, current_user.name, team.name, member.email, 1)
      # return team 
      return {:err => nil, :data => team}
    end 
    

    #decline request 
    def decline(params, current_user)
      # check for blank id 
      render :json => { :err=>"e1", :data => "Invalid request!" } if params[:id].blank?
      # fetch the team 
      team = current_user.owned_team
      return {:err =>"e1", :data => "No such team"} if team.blank?
      # Fetch the request
      join_request = JoinRequest.where(:user_id=>params[:id], :team_id =>team.id).first
      return {:err =>"e2", :data => "No such request"} if join_request.blank?
      # Get user to send email 
      member = User.find(join_request.user_id)
      # Deelte request 
      join_request.delete
      # Send email 
      Resque.enqueue(DecideTeamMailer, current_user.name, team.name, member.email, 0) if member.user_id != current_user.id
      # return 
      return {:err =>nil, :data => team} 
    end 

   
  end 
end
