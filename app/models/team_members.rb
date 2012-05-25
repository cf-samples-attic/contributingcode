class TeamMembers < ActiveRecord::Base
  class << self 

    # Add members to teams 
    # Send them an email to confirm the team
    def add_members(current_user, team, members)
      members.each do |user|
        member = TeamMembers.new
        member.team_id = team.id
        member.user_id = user.id
        member.status = false 
        member.token = Digest::SHA1.hexdigest([Time.now, user.id, rand].join).slice(0..5)
        if  member.save
          Notifier.join_team_email(current_user, team, user, member).deliver
        end 
      end 
      member = TeamMembers.new(:team_id => team.id, :user_id => current_user.id, :status => true)
      member.save
      return true
    end 

  end 
end
