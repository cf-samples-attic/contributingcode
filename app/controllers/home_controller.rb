class HomeController < ApplicationController


  # Landing page 
  # Gather all info if user is logged in 
  # Lists teams
  def index
    if current_user.present?
      @teams = Team.all
      # Check to determine if the current_ user already is in a team ?
      @is_member = current_user.team_member
      if @is_member.blank?
        # collect requests to join if any 
        @requested_teams = current_user.join_requests.collect(&:id)
      else  
        # Fined the current user's team
        @my_team = Team.find(@is_member.team_id) 
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
   

  # Update user info as soon as the first github authorization occurs 
  # User submits email 
  # optionally avatar 
  def update_user
    user = User.update_info(params, current_user)
    user = user[:data]
    Resque.enqueue(RegisterMailer, user.id)
    redirect_to root_url
  end  

end
