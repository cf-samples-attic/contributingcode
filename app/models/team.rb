class Team < ActiveRecord::Base
  belongs_to :user 

  has_many :team_members, :dependent => :destroy
  has_many :join_requests, :dependent => :destroy

  


  class << self 

    # Create New Team
    # <b>Expects</b>
    # * <em>params</em> Teamname and member's email 
    # * <em>current_user</em> user id
    #
    # <b>Returns</b>
    # * <em>Hash[:err]</em> Error code
    # * <em>Hash[:data]</em> Team
    def create_team(params, current_user)
      # return if no name
      return {:err => "e1", :data => "Team name cannot be blank !"} if params[:name].blank?
      # double check if user is already a part of a team
      already_member = current_user.team_member
      return {:err => "e5", :data => "you are already in a Team !"} if already_member.present?
      team = Team.new( 
          :name => params[:name], 
          :desc => params[:desc],
          :owner_id => current_user.id,
          :owner_handle => current_user.handle,
          :member_count => 1,
          :image => params[:image])
      # sanitize emails (trim whitespaces and split by comman)
      emails = params[:emails].compact.reject(&:blank?).uniq
      # remove current user 
      emails.delete(current_user.email)
      # Find if all emails are registered users 
      existing_users = User.where(:email => emails) 
      if existing_users.size != emails.size 
        return {:err => "e2", :data => "Unregistered members!"}
      end
      # check is already belong to team 
      members_already = TeamMember.where(:user_id => existing_users.collect(&:id))
      return {:err => "e4", :data => "Few members already belong to another team !"} if members_already.length > 0
      # check for save
      if team.save
        member = TeamMember.new(:team_id => team.id, :user_id => current_user.id, :user_handle => current_user.handle)
        member.save
      
        # Delete previous requests
        current_user.join_requests.delete
        # TeamMember.add_members(current_user,team,existing_users)
        return {:err => nil, :data => team}
      else 
        return {:err => "e3", :data => "Error! Please try again later!"}
      end
    end


    # user leaves team 
    # Remove team_member
    # decrease count in team 
    # Email owner 
    def leave_team(current_user)
      # Get the member info 
      team_member = current_user.team_member
      # return error if user has no team
      render :json => {:err =>"e1", :data => "Invalid request"} if team_member.blank? 
      # Find the team
      team = Team.where(:id => team_member.team_id).first
      render :json => {:err =>"e2", :data => "No such team"} if team.blank?
      team.member_count = team.member_count - 1 
      team_member.delete
      team.save
      # email
      owner = User.find(team.owner_id)
      Resque.enqueue(DecideTeamMailer, current_user.name, team.name, owner.email, 2)
      return {:err => nil, :data => team}
    end 

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

    # Remove member from team 
    def remove_memeber(params, current_user)
      return { :err=>"e1", :data => "Invalid request!" } if params[:id].blank?
      team = current_user.owned_team
      return {:err =>"e2", :data => "No such team"} if team.blank?
      # Check if the user is a member of the team 
      team_member = TeamMember.where(:user_id=>params[:id], :team_id =>team.id).first
      return {:err =>"e3", :data => "No such memeber in team"} if team_member.blank?
      # Find member to email 
      member = User.find(team_member.user_id)
      team_member.delete
      # Decrease team count and save 
      team.member_count = team.member_count - 1 
      team.save
      # EMail user as removed form team 
      Resque.enqueue(DecideTeamMailer, current_user.name, team.name, member.email, 3) 
      return {:err =>nil, :data => team} 
    end 

    def delete_team(params, current_user) 
      team = current_user.owned_team
      return {:err =>"e1", :data => "No such team"} if team.blank?
      team_members = team.team_members
      # collect all users in team 
      users = User.where(:id => team_members.collect(&:user_id)).index_by(&:id)
      puts users.inspect
      # Send email to each memeber
      team_members.each do |member|
        # send email to all except owner
        Resque.enqueue(DecideTeamMailer, current_user.name, team.name, users[member.user_id].email, 4) if member.user_id != current_user.id
      end
      team.destroy
      return {:err =>nil, :data => "Deleted!"} 
    end
   
  end 
end
