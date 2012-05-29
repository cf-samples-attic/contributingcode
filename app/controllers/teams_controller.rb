class TeamsController < ApplicationController
 before_filter :require_user
  
  def new 
  end 

  def create 
    team = Team.create_team(params,current_user)
    if team[:err].present?
      render :json => {:err => "e1", :data=> team[:data]} 
    else 
      render :json => {:err => nil, :data=> team[:data]} 
    end 
  end 

  def index 
    @teams = Team.all
  end 

  def update 
  end 

  def delete 
  end 

  # User joins existing teams 
  # 
  def join
    team = Team.join(current_user,params[:id]) 
    render :json => {:err =>team["err"], :data => team[:data]} 
  end 

  def leave
    team = Team.leave
     if team[:err].present?
      render :json => {:err => "e1", :data=> team[:data]} 
    else 
      render :json => {:err => nil, :data=> team[:data]} 
    end
  end 

end
