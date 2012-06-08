class AddRequest < ActiveRecord::Base
 belongs_to :user 
 validate :user_not_in_a_team


 # def team_ownership
 #   if current_user.owned_team.blank?
 #     errors.add(:team_id,"User does not own a team")
 #   end
 # end

 def user_not_in_a_team
    user = User.where(:id => user_id).first
    team = user.team
    puts team.inspect
    if team.present?
     errors.add(:user_id,"Already in a team")
    end   
 end

end
