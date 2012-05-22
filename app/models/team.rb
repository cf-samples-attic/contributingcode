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
      team.member_count = team.member_count + emails.size()
      if team.save
        TeamMembers.add_members(team.id,existing_users.collect(&:id)) if emails.size != 0 
        return {:err => nil, :data => team}
      else 
        return {:err => "e3", :data => "Error! Please try again later!"}
      end
    end

  end 
end
