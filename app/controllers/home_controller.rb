class HomeController < ApplicationController


  def index
    if current_user.present?
      @teams = Team.all
      @owner = Team.where(:owner_id => current_user.id).first 
    end
  end
   
  def update_user
    user = User.update_info(params, current_user)
    user = user[:data]
    Notifier.register_email(user.name, user.email).deliver
    redirect_to root_url
  end 

end
