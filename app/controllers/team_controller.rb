class TeamController < ApplicationController

  def new 
  end 

  def create 
    raise params.inspect 
    team = Team.create_team(params,current_user)
    redirect_to root_url
  end 

  def index 
  end 

  def update 
  end 

  def delete 
  end 

end
