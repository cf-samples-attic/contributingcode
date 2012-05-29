class HomeController < ApplicationController


  def index
    if current_user.present?
      @teams = Team.all
      # Check to determine if the current_ user already is in a team ?
      @is_member = TeamMembers.where(:user_id => current_user.id, :status => true).first 
      if @is_member.blank?
        # collect requests to join if any 
        @has_requested = TeamMembers.where(:user_id => current_user.id).collect(&:team_id) 
      end 
    end 
  end
   
  def update_user
    user = User.update_info(params, current_user)
    user = user[:data]
    Notifier.register_email(user.name, user.email).deliver
    redirect_to root_url
  end 


  # Click form accept in email brings here 
  def accept_team
    team_member =  TeamMembers.where(:token=>params[:token], :status =>false).first
    if team_member.present? 
      team = Team.find(team_member.team_id)
      if team.member_count < 4
        team_member.status = true
        team_member.save
        team.member_count = team.member_count+1
        team.save
      else 
        team_member.delete
      end 
    end 
    redirect_to "/"
  end 

  # click from decline in email brings here 
  def decline_team 
    team_member = TeamMembers.where(:token=>params[:token], :status =>false).first
    if team_member.present? 
      team_member.delete
    end 
    redirect_to "/"
  end 

end
