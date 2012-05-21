class TeamsController < ApplicationController
 before_filter :require_user
  def new 
  end 

  def create 
    puts params.inspect
    team = Team.create_team(params,current_user)
    if team[:err].present?
      render :json => {:err => "e1", :data=> team[:data]} 
    else 
      render :json => {:err => nil, :data=> teams_path} 
    end 
  end 

  def index 
    @teams = Team.all
  end 

  def update 
  end 

  def delete 
  end 

end
