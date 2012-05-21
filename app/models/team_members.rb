class TeamMembers < ActiveRecord::Base
  class << self 

    def add_members(team.id,uids)
      return true if uids.blank?
       uids.each do |uid|
          member = TeamMembers.new(:team_id => team.id, :user_id => uid )
          member.save
       end 
       return true
    end 

  end 
end
