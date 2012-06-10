class HomeController < ApplicationController

  # Landing page 
  # Gather all info if user is logged in 
  # Lists teams
  def index
    if current_user.present?
      # Get all teams
      @teams = Team.all
      # Get all users
      @users = User.all
      # Check to determine if the current_ user already is in a team ?
      @is_member = current_user.team_member
      if @is_member.blank?
        # For propmpting to add users (auto complete)
        @handles = User.all.collect(&:handle)
        @handles = @handles.to_s
        # collect requests to join if any 
        @requested_teams = current_user.join_requests.collect(&:team_id)
      else  
        # Fined the current user's team
        @my_team = current_user.team
        # Push into array to remove from list of team members 
        owner = [@is_member]
        # REmove owner 
        @team_members = @my_team.team_members - owner
        # To show team join requests to owner alone 
        if @my_team.owner_id == current_user.id
          @requests = @my_team.join_requests
        end 
      end 
    end 
  end
   
end
