class Team < ActiveRecord::Base
  class << self 

    # Create New Team
    # @date 05/21/2012 
    # @author Magil
    #
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
      already_member = TeamMembers.where(:user_id=>current_user.id, :status => true).first
      return {:err => "e5", :data => "you are already in a Team !"} if already_member.present?
      team = Team.new( 
          :name => params[:name], 
          :owner_id => current_user.id,
          :member_count => 1)
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
       members_already = TeamMembers.where(:user_id => existing_users.collect(&:id), :status => true)
      return {:err => "e4", :data => "Few members already belong to another team !"} if members_already.length > 0
      # check for save
      if team.save
        # Delete previous requests
        my_requests = TeamMembers.where(:user_id=>current_user.id)
        my_requests.each do |request|
          request.delete
        end
        TeamMembers.add_members(current_user,team,existing_users)
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
      team_member = TeamMembers.where(:user_id=>current_user.id, :status => true).first
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
      Notifier.decide_team_email(current_user, team, owner, 2).deliver
      return {:err => nil, :data => team}
    end 

    # Join team 
    def join(current_user,team_id)
      # check if the user is already in a team 
      member = TeamMembers.where(:user_id => current_user.id, :status => true).first
      return {:err => "e1", :data => "You are already in a team !"} if member.present?
      # Get the team record  
      team = Team.find(team_id)
      # check if there exists a team with the id in params
      return {:err => "e2", :data => "No such team !"} if team.blank?
      # Check for team size
      return {:err => "e3", :data => "Team has already has four members !"} if team.member_count == 4
      # Add to team members 
      team_member = TeamMembers.new(:team_id => team_id, :user_id => current_user.id, :status => false)
      # save teammember 
      team_member.save
      # Query owner user object 
      owner = User.find(team.owner_id)
      # Now send an accept email to owner 
      Notifier.join_team_email(current_user, team, owner, 1).deliver
      return {:err => nil, :data => team_member}
    end


  end 
end
