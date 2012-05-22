class TeamMembers < ActiveRecord::Base
  class << self 

    def add_members(team_id,uids)
      puts uids.inspect
       uids.each do |uid|
          member = TeamMembers.new(:team_id => team_id, :user_id => uid )
          member.save
       end 
       return true
    end 

  end 
end
