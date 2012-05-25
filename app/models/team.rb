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
      if team.save
        TeamMembers.add_members(current_user,team,existing_users) if emails.size != 0 
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
    team_member = TeamMembers.where(:user_id => current_user.id).first 
    if team_members.blank? 
      return {:err => "e1", :data => "You are not in any team !"}
    end 
    team = Team.find(team_member.team_id)
    team.count = team.count - 1 
    team_member.delete
    return {:err => nil, :data => team}
  end 

  end 
end
