class TeamMember < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :team

  class << self 

    # Add members to teams 
    # Send them an email to confirm the team
    def add_members(current_user, team, members)
      members.each do |user|
        member = TeamMember.new
        member.team_id = team.id
        member.user_id = user.id
        member.user_handle = user.handle 
        if  member.save
          Resque.enqueue(RequestMailer,current_user.name,team.name,user.email,0)
        end 
      end 
      member = TeamMember.new(:team_id => team.id, :user_id => current_user.id, :user_handle => current_user.handle)
      member.save
      return true
    end 

  end 
end
